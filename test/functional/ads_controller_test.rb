require 'test_helper'

class AdsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:fred)
    sign_in @user
    @ad = ads(:one)
    @update_attributes = {title: 'Title', company: 'Company', description: 'Description'}
  end

  test "should get index if signed in" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ads)
  end

  test "should get index if signed out" do
    sign_out @user
    get :index
    assert_response :success
    assert_not_nil assigns(:ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get new if signed out" do
    sign_out @user
    get :new
    assert_redirected_to new_user_session_path
  end

  test "should create ad" do
    assert_difference('Ad.count') do
      post :create, ad: @update_attributes
    end
    assert_redirected_to ad_path(assigns(:ad))
  end

  test "should not create ad if signed out" do
    sign_out @user
    assert_no_difference('Ad.count') do
      post :create, ad: @update_attributes
    end
    assert_redirected_to new_user_session_path
  end

  test "should show ad if signed in" do
    get :show, id: @ad.to_param
    assert_response :success
  end

  test "should show ad if signed out" do
    sign_out @user
    get :show, id: @ad.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad.to_param
    assert_response :success
  end

  test "should not get edit if signed out" do
    sign_out @user
    get :edit, id: @ad.to_param
    assert_redirected_to new_user_session_path
  end

  test "should not get edit someone else's add'" do
    sign_in users(:barney)
    get :edit, id: @ad.to_param
    assert_redirected_to ads_path
  end

  test "should update ad" do
    put :update, id: @ad.to_param, ad: @update_attributes
    assert_redirected_to ad_path(assigns(:ad))
  end

  test "should not update ad if signed out" do
    sign_out @user
    put :update, id: @ad.to_param, ad: @update_attributes
    assert_redirected_to new_user_session_path
  end

  test "should not update someone else's ad" do
    sign_in users(:barney)
    put :update, id: @ad.to_param, ad: @update_attributes
    assert_redirected_to ads_path
  end

  test "should destroy ad" do
    assert_difference('Ad.count', -1) do
      delete :destroy, id: @ad.to_param
    end
    assert_redirected_to ads_path
  end

  test "should not destroy ad if signed out" do
    sign_out @user
    assert_no_difference('Ad.count') do
      delete :destroy, id: @ad.to_param
    end
    assert_redirected_to new_user_session_path
  end

  test "should not destroy someone else's ad" do
    sign_in users(:barney)
    delete :destroy, id: @ad.to_param
    assert_redirected_to ads_path
  end

end
