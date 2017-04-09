require 'test_helper'

class SearchTest < Minitest::Test
  def setup
    @page_1 = File.read File.expand_path("page-1.html", "test/data")
    @page_2 = File.read File.expand_path("page-2.html", "test/data")
    @page_3 = File.read File.expand_path("page-empty.html", "test/data")

    stub_request(:get, "https://www.example.com/mp3/we+are+the+champions?page=1").
      to_return(:status => 200, :body => @page_1, :headers => {})

    stub_request(:get, "https://www.example.com/mp3/we+are+the+champions?page=2").
      to_return(:status => 200, :body => @page_2, :headers => {})

    stub_request(:get, "https://www.example.com/mp3/we+are+the+champions?page=3").
      to_return(:status => 200, :body => @page_3, :headers => {})

    stub_request(:post, "https://www.example.com/bitrate/").
      to_return(:status => 200, :body => "<li>Size: 1.40 мб.&nbsp;&nbsp;&nbsp; Bitrate: 64 kbs.</li>", :headers => {})
  end

  def test_url
    assert_equal "https://www.example.com/mp3/we+are+the+champions",
      Sektor::Search.new("we are the champions").url
  end

  def test_all_results
    assert_equal [
      {:id=>"-50678799_422765730", :artist=>"Freddie Mercury & Queen", :title=>"We Are The Champions", :time=>182, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=-50678799_422765730"},
      {:id=>"-71316392_281129508", :artist=>"Glee Cast", :title=>"We Are The Champions", :time=>194, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=-71316392_281129508"},
      {:id=>"59510463_249021867", :artist=>"Queen", :title=>"We Are The Champions (DJ Rockstar Remix)", :time=>302, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=59510463_249021867"},
      {:id=>"156750209_321808611", :artist=>"12. Валерия Симулик", :title=>"We Are The Champions (Queen cover)", :time=>168, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=156750209_321808611"},
      {:id=>"45345721_161081239", :artist=>"Queen for children", :title=>"We are the champions", :time=>189, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=45345721_161081239"},
      {:id=>"243616653_271086345", :artist=>"Земфира/Queen", :title=>"We are the champions", :time=>245, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=243616653_271086345"},
      {:id=>"-51614034_337392344", :artist=>"Село i Люди", :title=>"We Are The Champions (Queen)", :time=>62, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=-51614034_337392344"},
      {:id=>"236898965_343681340", :artist=>"Богдан Палий", :title=>"We are the champions", :time=>186, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=236898965_343681340"},
      {:id=>"22226641_163479057", :artist=>"-", :title=>"Ода бороде (We Are The Champions)", :time=>103, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=22226641_163479057"},
      {:id=>"7978948_364145213", :artist=>"Instrumental Champions", :title=>"We Are The World", :time=>287, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=7978948_364145213"}
    ], Sektor::Search.new("we are the champions").all
  end

  def test_page_1_has_results
    assert_equal [
      {:id=>"-50678799_422765730", :artist=>"Freddie Mercury & Queen", :title=>"We Are The Champions", :time=>182, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=-50678799_422765730"},
      {:id=>"-71316392_281129508", :artist=>"Glee Cast", :title=>"We Are The Champions", :time=>194, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=-71316392_281129508"},
      {:id=>"59510463_249021867", :artist=>"Queen", :title=>"We Are The Champions (DJ Rockstar Remix)", :time=>302, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=59510463_249021867"},
      {:id=>"156750209_321808611", :artist=>"12. Валерия Симулик", :title=>"We Are The Champions (Queen cover)", :time=>168, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=156750209_321808611"},
      {:id=>"45345721_161081239", :artist=>"Queen for children", :title=>"We are the champions", :time=>189, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=45345721_161081239"},
    ], Sektor::Search.new("we are the champions").page(1)
  end

  def test_page_2_has_results
    assert_equal [
      {:id=>"243616653_271086345", :artist=>"Земфира/Queen", :title=>"We are the champions", :time=>245, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=243616653_271086345"},
      {:id=>"-51614034_337392344", :artist=>"Село i Люди", :title=>"We Are The Champions (Queen)", :time=>62, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=-51614034_337392344"},
      {:id=>"236898965_343681340", :artist=>"Богдан Палий", :title=>"We are the champions", :time=>186, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=236898965_343681340"},
      {:id=>"22226641_163479057", :artist=>"-", :title=>"Ода бороде (We Are The Champions)", :time=>103, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=22226641_163479057"},
      {:id=>"7978948_364145213", :artist=>"Instrumental Champions", :title=>"We Are The World", :time=>287, :size=>1433, :bitrate=>64, :link=>"https://mp3mp3.site/start.php?q=7978948_364145213"}
    ], Sektor::Search.new("we are the champions").page(2)
  end

  def test_page_3_is_empty
    assert_equal [], Sektor::Search.new("we are the champions").page(3)
  end
end
