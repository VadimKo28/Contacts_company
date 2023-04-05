require 'test_helper'

class DepartamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get departaments_index_url
    assert_response :success
  end

end
