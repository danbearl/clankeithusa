require 'spec_helper.rb'

describe Product do
  it "has a name" do
    product = Fabricate(:product, name: 'hat')

    product.name.should eq('hat')
  end

  it "has a description" do
    product = Fabricate(:product, description: 'a fun thing to wear on your head')

    product.description.should eq('a fun thing to wear on your head')
  end

  it "has a price" do
    product = Fabricate(:product, price: 5.99)

    product.price.should eq(5.99)
  end

  it "can have color options" do
    product_with_colors = Fabricate(:product, colors: "red,green,blue")
    product_without_colors = Fabricate(:product, colors: '')

    product_with_colors.list_colors.should eq(["red","green","blue"])
    product_without_colors.list_colors.should eq(false)
  end

  it "can have sizes" do
    product_with_sizes = Fabricate(:product, sizes: "xs,s,m,l,xl")
    product_without_sizes = Fabricate(:product, sizes: '')

    product_with_sizes.list_sizes.should eq(["xs","s","m","l","xl"])
    product_without_sizes.list_sizes.should eq(false)
  end

  it "has an image" do
    product = Fabricate(:product, image: "img001.jpg")

    product.image.should eq("img001.jpg")
  end
end
