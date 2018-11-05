require 'test_helper'

class EngineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get engine_index_url
    assert_response :success
  end

  test "should get show" do
    get engine_show_url
    assert_response :success
  end

end
