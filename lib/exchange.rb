module BlockchainInfo
  class Exchange < BlockchainInfo::Ressource

    # Returns a JSON object with the currency codes as keys. "15m" is the 15 minutes delayed market price, "24h" is the 24 hour average market price, "symbol" is the currency symbol.
    # {
    #   "GBP" : {"last" : 22.9525, "buy" : 22.83201, "sell" : 23.0, "24h" : 23.1, "symbol" : "£"},
    #   "EUR" : {"last" : 26.32999, "buy" : 26.33, "sell" : 26.81774, "24h" : 26.7, "symbol" : "€"},
    #   ...
    # }
    def self.ticker
      query('ticker')
    end

    # Returns the value in BTC.
    def self.to_btc currency, value
      query('tobtc', { currency: currency, value: value })
    end
  end
end
