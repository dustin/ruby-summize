# A simple summize client for ruby.

## Example

    require 'summize'

    r = Summize.query 'search query'
    r.each { |i| puts "#{i.text}" }
