require 'test_helper'

class BitrateParserTest < Minitest::Test
  def setup
    @res = Minitest::Mock.new
    @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>" 
    @html = File.read File.expand_path("track_fragment.html", "test/data")
  end

  def test_parse
    Net::HTTP.stub :post_form, @res do
      assert_equal 64, Sektor::BitrateParser.parse(@html)
    end
  end
end

