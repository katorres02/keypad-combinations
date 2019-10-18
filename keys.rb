require 'pry'

class Combination
  attr_reader :arr, :message, :data

  def initialize(args)
    @message = args.fetch(:message).split('')
    @arr     = args.fetch(:arr).insert(1, ' ')
    @data    = []
  end

  def combinations
    result.collect { |x| x[:index] == 0 ? x[:index] + 1 : x[:index] }.sum + 1
  end 

  def result
    @result ||= sort
  end

  def call
    arr.each_with_index { |k, i| data << structure(i, k) if contain_char?(k) }
    data.flatten!
  end

  def sort 
    call
    data.sort_by {|k| k[:index] }
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
    { button: args[:button], key: args[:key], index: args[:pos], sort: args[:sort] }
  end
end
