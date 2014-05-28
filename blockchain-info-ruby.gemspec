# cat blockchain-info-ruby.gemspec
Gem::Specification.new do |s|
  s.name        = 'blockchain-info-ruby'
  s.version     = '1.0.0'
  s.date        = '2014-05-28'
  s.summary     = "blockchain.info API"
  s.description = "This API allow you to interact with blockchain.info APIs"
  s.authors     = ["Eric Larcheveque", "Vincent Renaudineau"]
  s.email       = 'vrenaud@lamaisondubitcoin.fr'
  s.files       = ["lib/blockchain_info.rb", "lib/charts.rb", "lib/exchange.rb", "lib/merchant.rb", "lib/ressource.rb", "lib/wallet.rb"]
  s.homepage    = 'https://github.com/EpicDream/blockchain-info-ruby'
  s.license     = 'MIT'
end