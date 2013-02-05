class Order < ActiveRecord::Base
  attr_accessible :address_city, :address_state, :address_street_1, :address_street_2, :address_zip, :customer_first_name, :customer_last_name, :email, :notes, :processed, :products, :shipped, :stripe_card_token
  
  def subtotal
    products = Order.unpack_products(self.products)
    sub = 0

    products.each do |product|
      next if !product.has_key?(:price)

      sub += product[:price].to_f
    end

    return sub
  end

  def shipping
    sub = subtotal
    if sub <= 25
      return 5.95
    elsif sub <= 50
      return 7.95
    elsif sub <= 75
      return 8.95
    elsif sub <= 100
      return 9.95
    elsif sub <= 150
      return 12.95
    elsif sub <= 200
      return 13.95
    elsif sub > 200
      return 14.95
    end
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
