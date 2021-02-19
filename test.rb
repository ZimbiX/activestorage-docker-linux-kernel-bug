#!/usr/bin/env ruby
# Usage: ./test.rb <source file>

require 'tempfile'

intermediate_tempfile = Tempfile.new

FileUtils.copy_file(ARGV[0], intermediate_tempfile)

io = intermediate_tempfile.open

num_bytes_copied = IO.copy_stream(io, 'destination')

if num_bytes_copied == 0
  puts 'Copy failed'
else
  puts 'OK'
end
