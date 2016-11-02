require 'test_helper'

class SizeParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")

    stub_request(:post, "http://www.example.com/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {})
  end

  def test_parse
    assert_equal 1433,
      Sektor::SizeParser.parse(@html)
  end

  def test_format
    assert_equal 1433, Sektor::SizeParser.format("1.40")
    assert_equal 5324, Sektor::SizeParser.format("5.20")
  end

  def test_format_returns_0_for_nil
    assert_equal 0, Sektor::SizeParser.format(nil)
  end
end
