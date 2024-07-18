require "test_helper"

class LinkTest < ActionDispatch::IntegrationTest

  test "create link requires url" do
    post links_path, params: { link: { url: "" } }
    assert_response :unprocessable_entity
  end

  test "create link as guest" do
   assert_difference "Link.count" do
    post links_path(format: :turbo_stream), params: { link: { url: "https://www.google.com" } }
    assert_response :ok
    assert_nil Link.last.user_id
  end

  test "create link as user" do
    assert_difference "Link.count" do
    post links_path(format: :turbo_stream), params: { link: { url: "https://www.google.com" } }
    assert_response :ok
    assert_equal user.id, Link.last.user_id
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
