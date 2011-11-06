require 'test_helper'

class RepliesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:fred)
    sign_in @user
    @ad = ads(:one)
    @attributes = {body: "Body"}
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post :create, ad_id: @ad.to_param, reply: @attributes
    end
    assert_redirected_to ad_path(@ad)
  end

  test "should not create reply if signed out" do
    sign_out @user
    assert_no_difference('Reply.count') do
      post :create, ad_id: @ad.to_param, reply: @attributes
    end
    assert_redirected_to new_user_session_path
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete :destroy, id: @ad.to_param, ad_id: @ad.to_param
    end
    assert_redirected_to ad_path(@ad)
  end

  test "should not destroy reply if signed out" do
    sign_out @user
    assert_no_difference('Reply.count') do
      delete :destroy, id: @ad.to_param, ad_id: @ad.to_param
    end
    assert_redirected_to new_user_session_path
  end

  test "should not destroy someone else's reply" do
    sign_in users(:barney)
    delete :destroy, id: @ad.to_param, ad_id: @ad.to_param
    assert_redirected_to ads_url
  end

end
