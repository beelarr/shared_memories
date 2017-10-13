require 'yaml'

c = YAML::load_file('data.yaml')

class Mary
  def initialize(m)
    raise FileNotFoundError, "#{m} was not found" unless File.file?(m)

    @m = m
  end
  def send(m)
    @m['Mary'] << m
    o = File.open('data.yaml', 'r+')
    o.puts YAML::dump(@m)
    o.close
  end
end

cm = ARGV[0]
mary = Mary.new(c)
p mary.send(cm)