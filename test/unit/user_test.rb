require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid with valid attibutes" do
    u = User.new(email: 'user@host.com', name: 'User Name', password: 'secret')
    assert u.valid?
  end

  test "invalid if name is not present" do
    u = User.new(email: 'user@host.com', password: 'secret')
    assert u.invalid?
    assert u.errors[:name].any?
  end

end
