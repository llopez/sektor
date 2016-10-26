require 'test_helper'

class PageParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("page-1.html", "test/data")
    stub_request(:post, "http://www.my-free-mp3.org/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {}) 
  end

  def test_parse
    assert_equal([
      {:id=>"-50678799_422765730", :artist=>"Freddie Mercury & Queen", :title=>"We Are The Champions", :time=>"3:02", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-50678799_422765730"},
      {:id=>"-71316392_281129508", :artist=>"Glee Cast", :title=>"We Are The Champions", :time=>"3:14", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-71316392_281129508"},
      {:id=>"59510463_249021867", :artist=>"Queen", :title=>"We Are The Champions (DJ Rockstar Remix)", :time=>"5:02", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=59510463_249021867"},
      {:id=>"156750209_321808611", :artist=>"12. Валерия Симулик", :title=>"We Are The Champions (Queen cover)", :time=>"2:48", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=156750209_321808611"},
      {:id=>"45345721_161081239", :artist=>"Queen for children", :title=>"We are the champions", :time=>"3:09", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=45345721_161081239"}
    ], Sektor::PageParser.parse(@html))
  end
end
