require 'test_helper'

class RolesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get roles_controller_new_url
    assert_response :success
  end

  test "should get edit" do
    get roles_controller_edit_url
    assert_response :success
  end

  test "should get index" do
    get roles_controller_index_url
    assert_response :success
  end

end
