require 'yaml'

convo_history = YAML::load_file('data.yaml')

class Margaret
  def initialize(convo_history)
    @convo_history = convo_history
    # raise IOError, "#{convo_history} was not found" unless
    #   File.exists?(convo_history)
    # raise EOFError
  end

  def send_a_message(message)
    @convo_history['Margaret'] << message
    open_instance_of_file = File.open('data.yaml', 'r+')
    open_instance_of_file.puts YAML::dump(@convo_history)
    open_instance_of_file.close
  end
end

console_msg = ARGV[0]
g = Margaret.new(convo_history)
puts g.send_a_message(console_msg)













