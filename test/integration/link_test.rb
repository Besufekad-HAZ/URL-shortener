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
end
