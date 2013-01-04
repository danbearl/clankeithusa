class User < ActiveRecord::Base
  attr_accessible :admin, :crypted_password, :email, :name, :salt, :password, :password_confirmation

  include Authem::Model

end
