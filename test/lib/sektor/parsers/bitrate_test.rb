require 'test_helper'

class BitrateTest < Minitest::Test
  def setup
    @res = Minitest::Mock.new
    @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>" 
  end

  def test_parse
    Net::HTTP.stub :post_form, @res do
      assert_equal 64, Sektor::Parser::Bitrate.new("-50678799_422765730").parse
    end
  end
end
