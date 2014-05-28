module BlockchainInfo

  # See https://blockchain.info/fr/api/blockchain_wallet_api for more information.
  class Wallet < BlockchainInfo::Ressource

    # Return { "message" : "Sent 0.1 BTC to 1A8Ji..." , "tx_hash" : "f322d01ad784e5deeb25464a5781c3b20971c1863679ca506e702e3e33c18e9c" , "notice" : "Additional Message" }
    def self.send address, satoshi_amount, note=nil
      raise "Allowed only in production env" unless Rails.env.production?
      query_two_auth_wallet_api('payment', { method:"create", to:address, amount: satoshi_amount, note: note })
    end

    # recipients is Hash of {btc_address => amount}.
    # Return { "message" : "Sent To Multiple Recipients" , "tx_hash" : "f322d01ad784e5deeb25464a5781c3b20971c1863679ca506e702e3e33c18e9c" }
    def self.send_many recipients, note=nil
      raise "Allowed only in production env" unless Rails.env.production?
      query_two_auth_wallet_api('sendmany', { method:"create", recipients: recipients.to_json, note: note })
    end

    # Return { "balance": 1000 }
    def self.balance
      query_auth_wallet_api('balance', { method:"create" })
    end

    # Return { "addresses": [
    #    {"balance": 1400938800, "address": "1Q1AtvCyKhtveGm3187mgNRh5YcukUWjQC", "label": "SMS Deposits", "total_received": 5954572400 }
    # ] }
    def self.list_addresses confirmations=0
      query_auth_wallet_api('list', { method:"create", confirmations: confirmations })
    end

    # Return {"balance" : 50000000, "address" : "19r7jAbPDtfTKQ9VJpvDzFFxCjUJFKesVZ", "total_received" : 100000000}
    def self.address_balance address, confirmations=0
      query_auth_wallet_api('list', { method:"create", address: address, confirmations: confirmations })
    end

    # Return { "address" : "18fyqiZzndTxdVo7g9ouRogB4uFj86JJiy" , "label":  "Order No : 1234" }
    def self.new_address label=nil
      query_two_auth_wallet_api('new_address', { method:"create", label: label })
    end
  end
end
