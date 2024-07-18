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
  end

  test "create link as user" do
    user = users(:one)
    sign_in user
    assert_difference "Link.count" do
      post links_path(format: :turbo_stream), params: { link: { url: "https://www.google.com" } }
      assert_response :ok
      assert_equal user.id, Link.last.user_id
    end
  end

  test "guest cannot edit link" do
    get edit_link_path(links(:anonymous))
    assert_response :redirect
  end

  test "guest cannot edit user's link" do
    get edit_link_path(links(:one))
    assert_response :redirect
  end

  test "users can edit their own link" do
    sign_in users(:one)
    get edit_link_path(links(:one))
    assert_response :ok
  end

  test "user cannot edit another user's link" do
    sign_in users(:one)
    get edit_link_path(links(:two))
    assert_response :redirect
  end

  test "user cannot edit anonymous link" do
    sign_in users(:one)
    get edit_link_path(links(:anonymous))
    assert_response :redirect
  end
end
