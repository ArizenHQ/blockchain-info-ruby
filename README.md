
BlockChainInfo Ruby
===================

This API allow you to interact with blockchain.info APIs.

Installation
============

    gem install blockchain-info-ruby

In a Rails app
--------------

Add in your <tt>Gemfile</tt> :

    gem 'blockchain-info-ruby', require: 'blockchain_info'

and then

    bundle install

Usage
=====

    require 'blockchain_info'

    # Initialization
    BlockchainInfo.configure do |c|
      c.domain = 'blockchain.info'
      c.my_wallet_guid = 'YOUR_GUID_ID'
      c.main_password = 'MY_PASSWORD'
      c.second_password = 'MY_SECOND_PASSWORD'
      c.key = 'API_KEY'
    end
    
    # View your balance
    puts BlockchainInfo::Wallet.balance
    # => { "balance": 1000 }
    
    # Send us 0.1 BTC :-)
    txid = BlockchainInfo::Wallet.send( '186e2PUgDoEZ14t25wYN8x1Ry5gtV3Qvj1', 0.1 )["tx_hash"]
    # => "f322d01ad784e5deeb25464a5781c3b20971c1863679ca506e702e3e33c18e9c"
    
    # View BTC value of 40 € at current exchange price.
    puts BlockchainInfo::Exchange.to_btc( 'EUR', 40 )
    => 0.1
    
    #
    puts BlockchainInfo::Charts.stats

See https://blockchain.info/fr/api for more information on return values.
