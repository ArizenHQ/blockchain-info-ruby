module BlockchainInfo
  class Ressource

  protected

    def self.query_merchant_api(route, data={})
      query('fr/api/' + route, data, true)
    end

    def self.query_charts_api(route, data={})
      query('charts/' + route, data)
    end

    def self.query_wallet_api(route, data={})
      guid = BlockchainInfo.configuration.my_wallet_guid
      query("fr/merchant/#{guid}/" + route, data)
    end

    def self.query_auth_wallet_api(route, data={})
      data[:password] = BlockchainInfo.configuration.main_password
      query_wallet_api(route, data)
    end

    def self.query_two_auth_wallet_api(route, data={})
      second_password = BlockchainInfo.configuration.second_password.present?
      data[:second_password] = second_password if second_password
      query_auth_wallet_api(route, data)
    end

    def self.query(route, data={}, secure=false)
      uri = uri_for(route, data, secure)
      request(uri)
    end

  private

    def self.request(uri)
      return {} if Rails.env.test?
      res = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new(uri.request_uri)
        http.request request
      end

      if res.code.to_i == 200
        begin
          JSON.parse(res.body)
        rescue JSON::ParserError => e
          res.body.is_a?(String) ? res.body : {"error" => "invalid json response" }
        end
      else
        {"error" => "service not available"}
      end
    rescue
      {"error" => "connexion refused"}
    end

    def self.uri_for(route, data, secure=true)
      path = '/' + route
      path += "?" + data.to_query if data.present?
      URI((secure ? "https" : "http") + "://" + File.join(BlockchainInfo.configuration.domain, path))
    end
  end
end
