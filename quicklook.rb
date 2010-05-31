#/usr/bin/env ruby

require 'curses'
include Curses

# Script should be provided with one argument, the name or path of a file

def print_usage
    puts "Usage: #{__FILE__} <filename>"
    exit -1
end

if(ARGV.count != 1)
    print_usage
    exit -1
end

if( !File.exist?(ARGV[0]) )
    puts "#{ARGV[0]}: no such file or directory"
    exit -1
end

if( File.directory?(ARGV[0]) )
    puts "#{ARGV[0]} is a directory"
    exit -1
end

system("qlmanage -p #{ARGV[0]} > /dev/null&")

print "Press Enter to Quit."

STDIN.gets 

system("killall qlmanage")

exit 0
