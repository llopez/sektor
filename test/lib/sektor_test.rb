require 'test_helper'

class SektorTest < Minitest::Test

  def setup
    page_1 = File.read File.expand_path("page-1.html", "test/data")
    page_2 = File.read File.expand_path("page-empty.html", "test/data")

    stub_request(:get, "http://www.my-free-mp3.org/mp3/we+are+the+champions?page=1").
      to_return(:status => 200, :body => page_1, :headers => {})

    stub_request(:get, "http://www.my-free-mp3.org/mp3/we+are+the+champions?page=2").
      to_return(:status => 200, :body => page_2, :headers => {})

    stub_request(:post, "http://www.my-free-mp3.org/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {})
  end

  def test_that_it_has_a_version_number
    refute_nil ::Sektor::VERSION
  end

  def test_that_search_returns_kind_of_result
    assert_kind_of Sektor::Result, Sektor.search("we are the champions") 
  end
end

