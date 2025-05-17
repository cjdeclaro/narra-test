require 'grader'
require 'stringio'

RSpec.describe Grader do
  let(:csv_content) do
    <<~CSV
      Name,English,Math,Physics
      Billy Joel,92,88,85
      Omar Hassan,78,98,95
      Ashley Bubble,85,90,91
    CSV
  end

  let(:csv_file) { StringIO.new(csv_content) }
  subject(:grader) { described_class.new(csv_file) }

  describe '#students' do
    it 'parses the correct number of students' do
      expect(grader.students.size).to eq(3)
    end

    it 'parses student names correctly' do
      names = grader.students.map { |s| s[:name] }
      expect(names).to contain_exactly('Billy Joel', 'Omar Hassan', 'Ashley Bubble')
    end

    it 'parses grades as integers' do
      student = grader.students.find { |s| s[:name] == 'Billy Joel' }
      expect(student[:grades]).to eq(english: 92, math: 88, physics: 85)
    end

    it 'computes the average grade correctly and rounds' do
      student = grader.students.find { |s| s[:name] == 'Billy Joel' }
      expect(student[:average]).to eq(88) # (92+88+85)/3 = 88.33 → 88
    end
  end
end
