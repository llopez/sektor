require 'test_helper'

class PageParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("page.html", "test/data")
    @res = Minitest::Mock.new
    40.times do
      @res.expect :body, "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>"
    end
  end

  def test_parse
    Net::HTTP.stub :post_form, @res do
      assert_equal([
        {:id=>"-50678799_422765730", :artist=>"Freddie Mercury & Queen", :title=>"We Are The Champions", :time=>"3:02", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-50678799_422765730"},
        {:id=>"-71316392_281129508", :artist=>"Glee Cast", :title=>"We Are The Champions", :time=>"3:14", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-71316392_281129508"},
        {:id=>"59510463_249021867", :artist=>"Queen", :title=>"We Are The Champions (DJ Rockstar Remix)", :time=>"5:02", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=59510463_249021867"},
        {:id=>"156750209_321808611", :artist=>"12. Валерия Симулик", :title=>"We Are The Champions (Queen cover)", :time=>"2:48", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=156750209_321808611"},
        {:id=>"45345721_161081239", :artist=>"Queen for children", :title=>"We are the champions", :time=>"3:09", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=45345721_161081239"},
        {:id=>"767620_151246331", :artist=>"Glee Cast", :title=>"We Are The Champions", :time=>"10:46", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=767620_151246331"},
        {:id=>"181265916_176865673", :artist=>"Glee Cast", :title=>"We Are The Champions (минус)", :time=>"2:41", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=181265916_176865673"},
        {:id=>"2849540_118295196", :artist=>"Robby Williams", :title=>"We Are The Champions (OST A Knight's Tale) (Queen cover)", :time=>"3:53", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=2849540_118295196"},
        {:id=>"7352469_74941085", :artist=>"London Symphony Orchestra", :title=>"We Are The Champions (Queen)", :time=>"3:06", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=7352469_74941085"},
        {:id=>"-20017659_341399879", :artist=>"Jimmy Fallon, The Roots, and Music Superstars", :title=>"We Are The Champions (A Cappella)", :time=>"3:00", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-20017659_341399879"},
        {:id=>"6516436_252479760", :artist=>"Queen", :title=>"We Are The Champions (DJ Rockstar Remix)", :time=>"3:21", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=6516436_252479760"},
        {:id=>"-68870809_277486247", :artist=>"Queen", :title=>"We Are The Champions ( Live Magic 1986 )", :time=>"2:01", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-68870809_277486247"},
        {:id=>"9314371_78368681", :artist=>"A Knight's Tale", :title=>"We Are The Champions", :time=>"3:54", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=9314371_78368681"},
        {:id=>"66109077_410310446", :artist=>"Crazy Frog", :title=>"We Are the Champions", :time=>"1:03", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=66109077_410310446"},
        {:id=>"150380012_174387204", :artist=>"World Olympics Pops Orchestra", :title=>"We are the Champions", :time=>"3:32", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=150380012_174387204"},
        {:id=>"33350099_125016656", :artist=>"Queen", :title=>"We Are The Champions (Минус)", :time=>"2:56", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=33350099_125016656"},
        {:id=>"2000501155_247066351", :artist=>"Queen", :title=>"We Are The Champions & We Will Rock You", :time=>"7:18", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=2000501155_247066351"}
      ], Sektor::PageParser.parse(@html))
    end
  end
end
