require 'test_helper'

class QueryTest < Minitest::Test
  def setup
    @collection = [
      Sektor::Track.new(1, 'example', 'example', 120, 3, 320, ""),
      Sektor::Track.new(2, 'example', 'example', 60, 3, 224, ""),
      Sektor::Track.new(3, 'example', 'example', 180, 3, 128, ""),
      Sektor::Track.new(4, 'example', 'example', 120, 3, 320, ""),
      Sektor::Track.new(5, 'example', 'example', 240, 3, 320, ""),
      Sektor::Track.new(6, 'example', 'example', 300, 3, 320, "")
    ]
  end

  def test_add_filter_bitrate_eq_128
    query = Sektor::Query.new(@collection)
    query.add_filter(:bitrate, :eq, 128)
    assert_equal @collection.values_at(2), query.result
  end

  def test_add_filter_bitrate_more_than_224
    query = Sektor::Query.new(@collection)
    query.add_filter(:bitrate, :more, 224)
    assert_equal @collection.values_at(0,3,4,5), query.result
  end

  def test_add_filter_bitrate_less_than_224
    query = Sektor::Query.new(@collection)
    query.add_filter(:bitrate, :less, 224)
    assert_equal @collection.values_at(2), query.result
  end
end

