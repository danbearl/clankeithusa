module Authem
  autoload :BaseUser,          './lib/authem/base_user'
  autoload :User,              './lib/authem/user'
  autoload :SorceryUser,       './lib/authem/sorcery_user'
  autoload :Config,            './lib/authem/config'
  autoload :ControllerSupport, './lib/authem/controller_support'
  autoload :Token,             './lib/authem/token'

  def self.configure(&block)
    Config.configure(&block)
  end
end
