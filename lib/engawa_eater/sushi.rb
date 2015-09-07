class Sushi
  attr_reader :name, :score, :stomach_status

  def initialize(name: nil, score: 0, stomach_status: 0)
    @name = name
    @score = score
    @stomach_status = stomach_status
  end
end
