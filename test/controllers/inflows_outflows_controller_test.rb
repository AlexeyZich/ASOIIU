require 'test_helper'

class InflowsOutflowsControllerTest < ActionDispatch::IntegrationTest
  test "should get projects" do
    get inflows_outflows_projects_url
    assert_response :success
  end

end
