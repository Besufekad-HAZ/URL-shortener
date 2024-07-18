require "test_helper"

class LinkTest < ActionDispatch::IntegrationTest

  test "create link requires url" do
    post links_path, params: { link: { url: "" } }
    assert_response :unprocessable_entity
  end

  test "create link as guest" do
   post links_path, params: { link: { url: "https://www.google.com" } }
   assert_response :ok
  end

  test "create link as user" do
    user = users(:one)
    sign_in_as user
    post links_path, params: { link: { url: "https://www.google.com" } }
    assert_equal 1, Link.count
  end

  test "cannot edit link as guest" do

  end

  test "cannot edit user's link as guest" do

  end

  test "can edit user's link as owner" do

  end

  test "cannot edit another user's link" do

  end
end
