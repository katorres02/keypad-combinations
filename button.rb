class Button
  attr_reader :content, :number
  def initialize(args)
    @content = args.fetch(:content).split('')
    @number  = args.fetch(:number)
  end

  def contain?(message)
    content.any? { |x| message.include? x }
  end

  def repetitions(index)
    [number.to_s] * (index + 1)
  end
end
