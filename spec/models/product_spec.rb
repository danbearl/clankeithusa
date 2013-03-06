require 'spec_helper.rb'

describe Product do
  describe "#list_colors" do
    it "lists color options when present" do
      product_with_colors = Fabricate(:product, colors: "red,green,blue")
      product_with_colors.list_colors.should eq(["red","green","blue"])
    end

    it "returns false if there are no color options" do
      product_empty_colors = Fabricate(:product, colors: '')
      product_nil_colors = Fabricate(:product, colors: nil)

      product_empty_colors.list_colors.should eq(false)
      product_nil_colors.list_colors.should eq(false)
    end
  end

  describe "#list_sizes" do
    it "lists size options when present" do
      product_with_sizes = Fabricate(:product, sizes: "xs,s,m,l,xl")

      product_with_sizes.list_sizes.should eq(["xs","s","m","l","xl"])
    end

    it "returns false if there are no size options" do
      product_empty_sizes = Fabricate(:product, sizes: '')
      product_nil_sizes = Fabricate(:product, sizes: nil)

      product_empty_sizes.list_sizes.should eq(false)
      product_nil_sizes.list_sizes.should eq(false)
    end
  end

end
