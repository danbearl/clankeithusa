require 'spec_helper'

describe Comment do
  comment = Fabricate(:comment)

  describe "#approve" do
    it 'flags the comment as approved' do
      comment.approve

      comment.approved.should eq(true)
    end

  end
end
