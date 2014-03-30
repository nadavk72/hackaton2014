class MyRequest < ActiveRecord::Base
	before_save :checkInjection
end

# test
def checkInjection
	# script
	if (self.request_parameters =~ /((\%3C)|<)((\%2F)|\/)*[a-z0-9\%]+((\%3E)|>)/) 
		# exec stored prcedure
		self.is_valid = 'false'
		self.attack_type = "CSS Attack"
	elsif (self.request_parameters =~ /exec(\s|\+)+(s|x)p\w+/ix)
		# sql commands
		self.is_valid = 'false'
		self.attack_type = "SQL Injection - Exec Stored Procedure Attack"
	elsif (self.request_parameters =~ /('(''|[^'])*')|(;)|(\b(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( INTO){0,1}|MERGE|SELECT|UPDATE|UNION( ALL){0,1})\b)/ix)
		# 1 == 1
		self.is_valid = 'false'
		self.attack_type = "SQL Injection - Run Query"
	elsif (self.request_parameters =~ /((\%3D)|(=))[^\n]*((\%27)|(\')|(\-\-)|(\%3B)|(;))/i) 
		self.attack_type = "SQL Injection - 1 == 1"
		self.is_valid = 'false'
	else
		self.is_valid = 'true'
	end
end
