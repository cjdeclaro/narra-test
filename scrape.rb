require "grader"
require "terminal-table"

file = File.open("./files/grades.csv")
grader = Grader.new(file)

# Extract headers dynamically
headers = ["Name"] + grader.students.first[:grades].keys.map(&:capitalize) + ["Average"]

# Generate rows for each student
rows = grader.students.map do |student|
  [
    student[:name],
    student[:grades][:english],
    student[:grades][:math],
    student[:grades][:physics],
    student[:average]
  ]
end

# Build and print the table
table = Terminal::Table.new headings: headers, rows: rows

puts table
