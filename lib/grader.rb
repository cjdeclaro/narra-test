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
        name: row[:first_name] + " " + row[:last_name],
        grades: grades,
        average: compute_average(grades)
      }

      @students << student
    end
  end

  def compute_average(grades)
    return 0 if grades.empty?

    (grades.values.sum.to_f / grades.size).floor
  end
end
