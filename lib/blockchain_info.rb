
module BlockchainInfo
  require 'json'
  require 'base64'
  require 'openssl'
  require 'net/http'

  autoload(:Ressource, 'ressource')
  autoload(:Charts, 'charts')
  autoload(:Exchange, 'exchange')
  autoload(:Wallet, 'wallet')
  autoload(:Merchant, 'merchant')
  autoload(:Data, 'data')

  class Configuration
    attr_accessor :domain
    attr_accessor :my_wallet_guid
    attr_accessor :main_password
    attr_accessor :second_password
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
