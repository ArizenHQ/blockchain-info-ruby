module BlockchainInfo
  class Merchant < BlockchainInfo::Ressource

    def self.receive address, callback_url, uuid=nil
      query_merchant_api('receive', { method:"create", address:address, callback:callback_url, uuid:uuid })
    end
  end
end
