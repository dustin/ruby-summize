require 'rubygems'
require 'net/http'
require 'json'

module Summize

  class Result
    VARS = [:text, :from_user, :created_at, :language, :id]
    attr_reader *VARS
    def initialize(h)
      VARS.each { |v| instance_variable_set "@#{v}", h[v.to_s] }
    end
  end

  class Results
    VARS = [:since_id, :max_id, :results_per_page, :page, :query, :next_page]
    attr_reader *VARS

    include Enumerable

    def initialize(h)
      @results = h['results'].map {|r| Result.new r }
      VARS.each { |v| instance_variable_set "@#{v}", h[v.to_s] }
    end

    def each(&block)
      @results.each(&block)
    end

  end

  class Client

    def initialize(agent="ruby-summize")
      @agent=agent
    end

    def query(text, opts={})
      runquery(mk_querystring(opts.merge({'q' => text})))
    end

    private

    def mk_querystring(h)
      h.map{|k,v| URI.escape(k.to_s) + "=" + URI.escape(v.to_s)}.join("&")
    end

    def runquery(query_str)
      url = URI.parse 'http://summize.com/search.json'
      url.query = query_str
      Results.new(JSON.parse(Net::HTTP.get(url)))
    end

  end

end
