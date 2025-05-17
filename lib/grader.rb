require 'csv'

class Grader
  attr_reader :students

  def initialize(csv_path)
    @csv_path = csv_path
    @students = []
    parse_csv
  end

  private

  def parse_csv
    csv_data = CSV.read(@csv_path, headers: true)
    csv_data.each do |row|
      student = {
        name: row['Name'],
        grades: {
          english: row['English'].to_i,
          math: row['Math'].to_i,
          physics: row['Physics'].to_i
        }
      }
      @students << student
    end
  end
end
