require 'csv'

class Grader
  attr_reader :students

  def initialize(file)
    @students = []
    parse_csv(file)
  end

  private

  def parse_csv(file)
    CSV.new(file, headers: true, header_converters: :symbol).each do |row|
      grades = {
        english: row[:english].to_i,
        math: row[:math].to_i,
        physics: row[:physics].to_i
      }

      student = {
        name: row[:name],
        grades: grades,
        average: 0
      }

      @students << student
    end
  end
end
