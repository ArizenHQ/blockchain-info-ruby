module BlockchainInfo

  # See https://blockchain.info/fr/api/blockchain_api for more information.
  class Data < BlockchainInfo::Ressource

    # Return {"hash":"...0000bae09a7a39...", "ver":1, "prev_block":"...00007d0f98d9...", "mrkl_root":"935aa0ed2e...", "time":1322131230, "bits":437129626, "nonce":2964215930, "n_tx":22, "size":9195, "block_index":818044, "main_chain":true, "height":154595, "received_time":1322131301, "relayed_by":"108.60.208.156", "tx":[--Array of Transactions--] }
    def self.block hash_or_index
      query("rawblock/#{hash_or_index}")
    end

    # Return {"hash":"b6f6991d03...", "ver":1, "vin_sz":1, "vout_sz":2, "lock_time":"Unavailable", "size":258, "relayed_by":"64.179.201.80", "block_height", 12200, "tx_index":"12563028", "inputs":[--Array of Inputs--], "out":[--Array of Ouputs--] }
    # Inputs {"prev_out":{"hash":"a3e2bcc9a5f776112497a32b05f4b9e5b2405ed9", "value":"100000000", "tx_index":"12554260", "n":"2"}, "script":"76a914641ad5051edd97029a003fe9efb29359fcee409d88ac"}
    # Outputs {"value":"98000000", "hash":"29d6a3540acfa0a950bef2bfdc75cd51c24390fd", "script":"76a914641ad5051edd97029a003fe9efb29359fcee409d88ac"}
    def self.transaction hash
      query("rawtx/#{hash}")
    end

  end
end
