class Sushi
  attr_reader :name, :score

  def initialize(name: nil, score: 0)
    @name = name
    @score = score
  end
end
