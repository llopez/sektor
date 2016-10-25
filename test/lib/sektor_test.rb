require 'test_helper'

class SektorTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("page.html", "test/data")
    @res = Minitest::Mock.new
    40.times do
      @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>"
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::Sektor::VERSION
  end

  def test_search
    Net::HTTP.stub :post_form, @res do
      assert_kind_of Sektor::Result, Sektor.search("we are the champions")
    end
  end
end
