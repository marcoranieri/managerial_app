require 'test_helper'

class KitchensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kitchens_index_url
    assert_response :success
  end

end
