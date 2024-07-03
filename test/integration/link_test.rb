require "test_helper"

class LinkTest < ActionDispatch::IntegrationTest
  test "create link as guest" do

  end

  test "create link as user" do
    user = users(:one)
    sign_in_as user
    post links_path, params: { link: { url: "https://www.google.com" } }
    assert_equal 1, Link.count
  end

  test "cannot edit a link as guest" do

  end

  test "cannot edit user's link as guest" do

  end

  test "can edit user's link as user" do
    user = users(:one)
    sign_in_as user
    link = links(:one)
    get edit_link_path(link)
    assert_response :success
  end

  test "cannot edit another user's link" do
    user = users(:one)
    sign_in_as user
    link = links(:one)
    patch link_path(link), params: { link: { url: "https://www.google.com" } }
    assert_equal "https://www.google.com", link.reload.url
  end
end
