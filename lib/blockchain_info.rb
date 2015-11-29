module BlockchainInfo
  require 'json'
  require 'base64'
  require 'openssl'
  require 'net/http'

  autoload(:Ressource, File.expand_path('ressource', __dir__))
  autoload(:Charts, File.expand_path('charts', __dir__))
  autoload(:Exchange, File.expand_path('exchange', __dir__))
  autoload(:Wallet, File.expand_path('wallet', __dir__))
  autoload(:Merchant, File.expand_path('merchant', __dir__))
  autoload(:Data, File.expand_path('data', __dir__))

  class Configuration
    attr_accessor :domain
    attr_accessor :my_wallet_guid
    attr_accessor :main_password
    attr_accessor :second_password
    attr_accessor :key
  end

  class << self
    attr_accessor :configuration
  end

  # BlockchainInfo.configure do |c|
  #   c.domain = 'blockchain.info'
  #   c.my_wallet_guid = 'YOUR_GUID_ID'
  #   ...
  # end
  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end
