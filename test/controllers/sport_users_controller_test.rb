require 'test_helper'

class SportUsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get sport_users_create_url
    assert_response :success
  end

  test 'should get update' do
    get sport_users_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get sport_users_destroy_url
    assert_response :success
  end
end
