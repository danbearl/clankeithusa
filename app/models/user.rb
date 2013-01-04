class User < ActiveRecord::Base
  attr_accessible :admin, :crypted_password, :email, :name, :salt
end
