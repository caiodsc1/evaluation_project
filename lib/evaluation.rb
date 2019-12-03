class Evaluation

  def build(length = 100)

    raise ArgumentError unless length.is_a?(Integer) && length.positive?

    arr = Array.new(length) { |index| evaluate(index.to_i + 1) }
    arr.join(', ')
  end

  private

  def evaluate(number)
    if number.modulo(35).zero?
      'Nama Team'
    elsif number.modulo(7).zero?
      'Team'
    elsif number.modulo(5).zero?
      'Nama'
    else
      number.to_s
    end
  end
end
