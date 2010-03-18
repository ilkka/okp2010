#!/usr/bin/env ruby
# OHJ-2050/2050 K2010 H3 T15
# Parse math expressions according to the grammar
# <expr> → <term> + <expr> | <term> - expr> | <term>
# <term> → <factor> * <term> | <factor> / <term> | <factor>
# <factor> → <number> | ( <expr> )
# <number> → <digit> | <digit><number>
# <digit> → 0 | . . . | 9

def parse_expr(expr)
  puts "expr #{expr}"
  case expr.split.size
  when 3
    eval "parse_term(expr.split[0]) #{expr.split[1]} parse_expr(expr.split[2])"
  when 1
    parse_term(expr)
  end
end

def parse_term(term)
  puts "term #{term}"
  case term.split.size
  when 3
    eval "parse_factor(term.split[0]) #{term.split[1]} parse_term(term.split[2])"
  when 1
    parse_factor(term)
  end
end

def parse_factor(factor)
  puts "factor #{factor}"
  case factor.to_s[0]
  when "("
    parse_expr(factor.to_s.gsub(/\((.*)\)/, '\1'))
  else
    parse_number(factor)
  end
end

def parse_number(number)
  puts "number #{number}"
  number.to_i
end

ARGF.each do |line|
  puts parse_expr(line.strip)
end

