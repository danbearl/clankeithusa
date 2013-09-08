class User < ActiveRecord::Base
  attr_accessible :admin, :crypted_password, :email, :name, :salt, :password, :password_confirmation

  include Authem::Model

  validates_presence_of :name
  validates_uniqueness_of :name

end
