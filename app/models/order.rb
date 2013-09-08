class Order < ActiveRecord::Base

  include StripeMethods

  attr_accessible :address_city, :address_state, :address_street_1, :address_street_2, :address_zip, :customer_first_name, :customer_last_name, :email, :notes, :processed, :products, :shipped, :stripe_payment_token
  
  attr_accessor :stripe_card_token

  def subtotal
    products = Order.unpack_products(self.products)
    sub = 0.00

    products.each do |product|
      next if !product.has_key?(:price)

      sub += product[:price].to_f * product[:quantity].to_i
    end

    return sub
  end

  def shipping
    Order.calc_shipping(subtotal)
  end

  def total
    return subtotal + shipping
  end

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

  def self.calc_shipping(sub)
    if sub <= 0
      shipping = 0
    elsif sub <= 25
      shipping = 5.95
    elsif sub <= 50
      shipping = 7.95
    elsif sub <= 75
      shipping = 8.95
    elsif sub <= 100
      shipping = 9.95
    elsif sub <= 150
      shipping = 12.95
    elsif sub <= 200
      shipping = 13.95
    elsif sub > 200
      shipping = 14.95
    end

    return shipping
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
