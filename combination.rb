module Combination
  def total
    r = []
    number.each_with_index do |b, i|
      if !r.empty? && (r.last[:number] == number[i])
         r.last[:count] = r.last[:count] + 1
      else
        r << {number: b, count: 1}
      end
    end
    combis = r.map do |x|
      combinations(buttons[x[:number].to_i].content, x[:count])
    end
    base = combis[0]
    base.product(*combis[1..combis.count-1])
  end

  def combinations(key, permutations)
    r = []
    default_combinations(key, permutations).each do |x|
      r.push(x)
      r.push(x.reverse) if x != x.reverse
    end
    r.map(&:join)
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
end
