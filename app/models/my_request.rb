class MyRequest < ActiveRecord::Base
	before_save :checkInjection
end

def checkInjection
	# script
	if (self.request_parameters =~ /((\%3C)|<)((\%2F)|\/)*[a-z0-9\%]+((\%3E)|>)/ or 
		# exec stored prcedure
		self.request_parameters =~ /exec(\s|\+)+(s|x)p\w+/ix or
		# sql commands
		self.request_parameters =~ /('(''|[^'])*')|(;)|(\b(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( INTO){0,1}|MERGE|SELECT|UPDATE|UNION( ALL){0,1})\b)/ix or
		# 1 == 1
		self.request_parameters =~ /((\%3D)|(=))[^\n]*((\%27)|(\')|(\-\-)|(\%3B)|(;))/i

		) 
		self.is_valid = 'false'
	else
		self.is_valid = 'true'
	end



	/exec(\s|\+)+(s|x)p\w+/ix
end
