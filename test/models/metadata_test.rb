require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "title attribute" do
    assert_equal "Hello", Metadata.new("<title>Hello</title>").title
  end

  test "missing title attribute" do
    assert_nil Metadata.new.title
  end

  test "description attribute" do
    assert_equal "Hello", Metadata.new("<meta name=description content=Hello>").description
  end
end
