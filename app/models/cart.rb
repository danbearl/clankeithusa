class Cart

  def self.subtotal(args)
    sub = 0
    args.each do |item|
      sub += item[:price].to_f * item[:quantity].to_f
    end
    return sub
  end

end
