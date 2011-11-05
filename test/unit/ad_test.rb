require 'test_helper'

class AdTest < ActiveSupport::TestCase

  test "valid with valid attributes" do
    ad = Ad.new(title: 'Title', company: 'Company', description: 'Description', user: users(:fred))
    assert(ad.valid?)
  end

  test "invalid with invalid attributes" do
    ad = Ad.new
    assert(ad.invalid?)
    assert ad.errors[:title].any?
    assert ad.errors[:company].any?
    assert ad.errors[:description].any?
  end

end
