#!/usr/bin/env ruby
# drop.rb
# 
# Description:
#   A simple script to share a file via dropbox and places the url in the clipboard
#   Mac OS X 10.3+ required
# Author: Sam Johnson
# Date: June 2, 2010
# Notes: Inspired by "Dropbox Public.py"

# If you're going to use this script change these values to match your setup
DROPBOX_NUMBER = 91529
DROPBOX_PATH = "~/DropBox/Public/"

def print_usage
    puts "Usage: #{__FILE__} <filename>"
    exit -1
end

fileName = ARGV.join("\\ ")

if(ARGV.count < 1)
    print_usage
    exit -1
end

if( !File.exist?(fileName) )
    puts "#{fileName}: no such file or directory"
    exit -1
end

if( File.directory?(fileName) )
    puts "#{fileName} is a directory"
    exit -1
end

system("cp #{fileName} #{DROPBOX_PATH}; echo http://dl.dropbox.com/u/#{DROPBOX_NUMBER}/#{fileName} | pbcopy")

exit 0

