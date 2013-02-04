class Order < ActiveRecord::Base
  attr_accessible :address_city, :address_state, :address_street_1, :address_street_2, :address_zip, :customer_first_name, :customer_last_name, :email, :notes, :processed, :products, :shipped, :stripe_card_token

  def self.pack_products(products)
    tmp = []
    products.each do |item|
      tmp << hash_to_string(item)
    end

    tmp.join("&")
  end

  def self.unpack_products(products)
    tmp = []
    products.split("&").each do |item|
      tmp << string_to_hash(item)
    end

    tmp
  end

  private
  
  def self.hash_to_string(hsh)
    tst = []
    hsh.each do |key, value| 
      tst << "#{value}@#{key}"
    end

    tst.join(",")
  end

  def self.string_to_hash(str)
    hsh = str.split(",").inject(Hash.new{|h,k| h[k]=""}) do |h,s|
      v, k = s.split(/@/)
      k = k.to_sym
      h[k] = v
      h
    end
  end
end
