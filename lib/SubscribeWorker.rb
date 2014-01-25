require 'rubygems'
require 'redis'
require 'json'

class SubscribeWorker

	def initialize
		p 'subscribeWorker initialize'
		@redis_conn = Redis.new(:host => '127.0.0.1', :port => 6379, :db => 2,:timeout => 0)
	end

	def work
    	#p 'subscribeWorker is working !!!!'
    	@redis_conn.subscribe('c_user') do |on|
		  on.message do |channel, msg|
		    begin
		    	data = JSON.parse(msg)
		    	@product = Product.new
		    	@product.name = "test2014"
		    	@product.save
		    	p "from channel[#{channel}] --> msg:#{msg}"
		    rescue
		    	p $! # => "unhandled exception"
		    end
		  end
		end
  	end

  	def redis_conn
  		@redis_conn
  	end

end