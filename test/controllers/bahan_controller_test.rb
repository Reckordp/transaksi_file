require 'test_helper'

class BahanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bahan_index_url
    assert_response :success
  end

end
