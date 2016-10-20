require 'test_helper'

class LinkTest < Minitest::Test
  def test_parse
    assert_equal "http://s.myfreemp3.space/s.php?q=-50678799_422765730", Sektor::Parser::Link.new("-50678799_422765730").parse
  end
end

