class Statement
  def self.load
    load_statement
  end

  private

  def self.load_statement
    file = File.open('./spec/test_statement.csv', 'r')
    statement = load_file(file)
    file.close
    return statement
  end

  def self.load_file(file)
    file.readlines.each do |line|
      line
    end
  end
end