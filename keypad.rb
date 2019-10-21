require 'pry'
require_relative 'button'
require_relative 'combination'

class Keypad
  attr_reader :message, :buttons, :data, :number, :config
  include Combination

  def initialize(args)
    @config  = args.fetch(:config)
    @data    = []
    @message = args.fetch(:message).split('')
  end

  def module_base
    1000000007
  end

  def result
    total.count % module_base
  end

  def number
    @number ||= generate_number
  end

  def buttons
    index = 0
    @buttons ||= config.collect do |content|
      index+=1
      Button.new(content: content, number: index)
    end.insert(0, Button.new(content: ' ', number: 0))
  end

  private

  def generate_number
    data.sort_by { |x| x[:sort] }.map { |b| b[:button].repetitions(b[:position]) }.join
  end

  def data
    return @data unless @data.empty?
    buttons.each_with_index { |b, i| @data << structure(i, b) if b.contain?(message) }
    @data.flatten!
  end
  
  def structure(index, button)
    message.map do |c|
      if pos = button.content.index(c)
        press_info(button: button, char: c, pos: pos, sort: message.index(c))
      end
    end.compact
  end

  def press_info(args)
    {
      button: args[:button], char: args[:char], position: args[:pos], sort: args[:sort]
    }
  end
end

