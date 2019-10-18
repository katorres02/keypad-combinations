require 'pry'

class Button
  attr_reader :content, :number
  def initialize(args)
    @content = args.fetch(:content).split('')
    @number  = args.fetch(:number)
  end

  def contain?(message)
    content.any? { |x| message.include? x }
  end
end

class Keypad
  attr_reader :message, :buttons, :data
  def initialize(args)
    @message = args.fetch(:message).split('')
    @buttons = []
    @data = []
    add_buttons(args.fetch(:arr))
  end

  def keys_pressed
    buttons.each_with_index { |b, i| data << structure(i, b) if b.contain?(message) }
  end
  
  def structure(index, button)
    message.map do |c|
      if pos = button.content.index(c)
        basic_object(button: index, char: c, pos: pos, sort: message.index(c))
      end
    end
  end

  def basic_object(args)
    {
      button: args[:button], char: args[:char], index: args[:pos], sort: args[:sort],
      combinations: []
    }
  end

  private

  def add_buttons(buttons)
    buttons.insert(0, ' ')
    buttons.each_with_index do |content, index|
      @buttons << Button.new(content: content, number: index + 1)
    end
  end
end

k= Keypad.new(arr: ["vbn", "xci", "dsf", "olk"], message: "si")
k.buttons
binding.pry
