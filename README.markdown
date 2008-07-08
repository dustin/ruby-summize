# A simple summize client for ruby.

## Example

    require 'summize'

	client = Summize::Client.new 'my-user-argent'
    r = client.query 'search query'
    r.each { |i| puts "#{i.text}" }
