class Section < ActiveRecord::Base
  has_many :pages

  attr_accessible :body, :name
end
