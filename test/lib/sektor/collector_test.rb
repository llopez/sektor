require 'test_helper'

class CollectorTest < Minitest::Test
  def setup
    @page_1 = File.read File.expand_path("page-1.html", "test/data")
    @page_2 = File.read File.expand_path("page-2.html", "test/data")
    @page_3 = File.read File.expand_path("page-empty.html", "test/data")

    stub_request(:get, "http://www.my-free-mp3.org/mp3/we+are+the+champions?page=1").
      to_return(:status => 200, :body => @page_1, :headers => {})

    stub_request(:get, "http://www.my-free-mp3.org/mp3/we+are+the+champions?page=2").
      to_return(:status => 200, :body => @page_2, :headers => {})

    stub_request(:get, "http://www.my-free-mp3.org/mp3/we+are+the+champions?page=3").
      to_return(:status => 200, :body => @page_3, :headers => {})

    stub_request(:post, "http://www.my-free-mp3.org/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {})
  end

  def test_url
    assert_equal "http://www.my-free-mp3.org/mp3/we+are+the+champions",
      Sektor::Collector.url("we are the champions")
  end

  def test_work
    assert_equal [
      {:id=>"-50678799_422765730", :artist=>"Freddie Mercury & Queen", :title=>"We Are The Champions", :time=>"3:02", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-50678799_422765730"},
      {:id=>"-71316392_281129508", :artist=>"Glee Cast", :title=>"We Are The Champions", :time=>"3:14", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-71316392_281129508"},
      {:id=>"59510463_249021867", :artist=>"Queen", :title=>"We Are The Champions (DJ Rockstar Remix)", :time=>"5:02", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=59510463_249021867"},
      {:id=>"156750209_321808611", :artist=>"12. Валерия Симулик", :title=>"We Are The Champions (Queen cover)", :time=>"2:48", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=156750209_321808611"},
      {:id=>"45345721_161081239", :artist=>"Queen for children", :title=>"We are the champions", :time=>"3:09", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=45345721_161081239"},
      {:id=>"243616653_271086345", :artist=>"Земфира/Queen", :title=>"We are the champions", :time=>"4:05", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=243616653_271086345"},
      {:id=>"-51614034_337392344", :artist=>"Село i Люди", :title=>"We Are The Champions (Queen)", :time=>"1:02", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=-51614034_337392344"},
      {:id=>"236898965_343681340", :artist=>"Богдан Палий", :title=>"We are the champions", :time=>"3:06", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=236898965_343681340"},
      {:id=>"22226641_163479057", :artist=>"-", :title=>"Ода бороде (We Are The Champions)", :time=>"1:43", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=22226641_163479057"},
      {:id=>"7978948_364145213", :artist=>"Instrumental Champions", :title=>"We Are The World", :time=>"4:47", :size=>"1.40", :bitrate=>64, :link=>"http://s.myfreemp3.space/s.php?q=7978948_364145213"}
    ], Sektor::Collector.work("we are the champions")
  end
end

