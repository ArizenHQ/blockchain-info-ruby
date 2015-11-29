module BlockchainInfo
  class Merchant < BlockchainInfo::Ressource

    def self.receive xpub, callback_url
      query_merchant_api('receive', { xpub: xpub, callback: callback_url })
    end
  end
end
