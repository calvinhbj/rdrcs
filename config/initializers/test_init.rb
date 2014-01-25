# encoding : utf-8
require './lib/SubscribeWorker'
p '执行订阅器'

begin
	#p Thread.list
	t = Thread.new do
		#Thread.pass
		#p Thread.current
		#p Thread.list
		#raise " unhandled exception"
		s = SubscribeWorker.new
		s.work
	end
	#t.join
rescue
	p $! # => "unhandled exception"
end

p '订阅器执行成功'
