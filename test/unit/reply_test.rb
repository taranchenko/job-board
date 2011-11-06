require "test_helper"

class ReplyTest < ActiveSupport::TestCase

  test "valid with valid attributes" do
    r = Reply.new({user_id: 1, ad_id: 1, body: 'body'})
    assert r.valid?
  end

  test "invalid with invalid attributes" do
    r = Reply.new
    assert r.invalid?
    assert r.errors[:body].any?
  end

end