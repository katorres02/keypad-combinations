require 'pry'

class Combination
  attr_reader :arr, :message, :data, :result

  def initialize(args)
    @message = args.fetch(:message).split('')
    @arr     = args.fetch(:arr).insert(0, ' ')
    @data    = []
  end

  def total
    buttons
    base = result[0][:combinations]
    permutations= result[1..result.count - 1].collect { |x| x[:combinations] }
    base.product(*permutations)
  end

  def combinations(key, permutations)
    r = []
    default_combinations(key, permutations).each do |x|
      r.push(x)
      r.push(x.reverse) if x != x.reverse
    end
    r#.map(&:join)
  end

  def default_combinations(key, value, max = value)
    if value == 0
      [[]]
    else
      1.upto(max).flat_map do |n|
        default_combinations(key, value - n, [value, n].min).map do |ns|
          [key[n-1]] + ns
        end
      end
    end
  end

  def buttons
    @buttons ||= buttons_details.collect { |b| b[:button].to_s * (b[:index]+1) }.join
  end

  def buttons_details
    @result ||= sort
  end

  def build_buttons
    arr.each_with_index { |k, i| data << structure(i, k) if contain_char?(k) }
    data.flatten!
  end

  def sort 
    build_buttons.sort_by {|k| k[:sort] }
  end

  def contain_char?(key)
    key.to_s.split('').any? { |k| message.include?(k) }
  end

  def structure(index, key)
    message.map do |c|
      if pos = key.index(c)
        basic_object(button: index, key: c, pos: pos, sort: message.index(c))
      end
    end.compact
  end

  def basic_object(args)
    {
      button: args[:button], key: args[:key], index: args[:pos], sort: args[:sort],
      combinations: combinations(arr[args[:button]], args[:pos] + 1)
    }
  end
end
