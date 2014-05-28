module BlockchainInfo

  # See https://blockchain.info/fr/api/charts_api for more informations.
  class Charts < BlockchainInfo::Ressource

    def self.chart type, format="json"
      query_charts_api(type, { format: format })
    end

    # Returns a JSON object containing the statistics seen on the stats page.
    def self.stats
      query('stats', { format: "json" })
    end
  end
end
