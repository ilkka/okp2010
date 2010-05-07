#!/usr/bin/env ruby

class ParityError < Exception
end

class ReadError < Exception
end

class Reader
  @@failedreads = 0

  def self.read
    @@failedreads += 1
    raise ParityError unless @@failedreads > 10
    raise ReadError
  end

  def self.backspace
    @@failedreads -= 1
  end
end

counter = 0
10.times do
  begin
    Reader::read
  rescue ParityError
    puts "ParityError #{counter += 1}"
  end
end

2.times do
  Reader::backspace
  puts "Backspaced to #{counter -= 1}"
  counter = 0 if counter < 0
end

3.times do
  begin
    Reader::read
  rescue ParityError
    puts "ParityError #{counter += 1}"
  rescue ReadError
    puts "ReadError after #{counter}"
  end
end

