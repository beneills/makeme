require 'test_helper'

class MakemeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Makeme::VERSION
  end

  def test_it_does_something_useful
    ::Makeme::test
  end
end
