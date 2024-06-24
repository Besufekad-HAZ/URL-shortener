require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "Title attribute" do
    assert_equal "Hello", Metadata.new("<title>Hello</title>").title
  end
end
