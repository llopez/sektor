module Sektor
  class Filter
    def initialize(field, predicate, value)
      @field = field
      @predicate = predicate
      @value = value
    end

    def eval(obj)
      value = obj.send(@field)

      if @predicate == :eq
        eval_eq(value)
      elsif @predicate == :more
        eval_more(value)
      elsif @predicate == :less
        eval_less(value)
      else
        raise "Not Implemented Predicate"
      end
    end

    def eval_eq(value)
      value == @value
    end

    def eval_more(value)
      value > @value
    end

    def eval_less(value)
      value < @value
    end
  end
end

