require 'test_helper'

class FilterTest < Minitest::Test
  def setup
    @obj = Sektor::Track.new(1, 'example', 'example', 120, 3, 320, "")
  end

  def test_eval_eq
    filter = Sektor::Filter.new(:bitrate, :eq, 320)
    assert filter.eval(@obj)
  end

  def test_eval_less
    filter = Sektor::Filter.new(:bitrate, :less, 320)
    refute filter.eval(@obj) 
  end

  def test_eval_more
    filter = Sektor::Filter.new(:bitrate, :more, 320)
    refute filter.eval(@obj) 
  end
end

