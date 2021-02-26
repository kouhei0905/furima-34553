require 'test_helper'

class FyrimasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fyrimas_index_url
    assert_response :success
  end

end
