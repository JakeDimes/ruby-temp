require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get dashboard_admin_url
    assert_response :success
  end

  test "should get student" do
    get dashboard_student_url
    assert_response :success
  end
end
