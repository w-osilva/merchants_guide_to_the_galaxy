$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'converter'

# Calls the method read_input_file passing the input file as a parameter
file = (ARGV[0]) ? ARGV[0] : "input.txt"
Converter.read_input_file file