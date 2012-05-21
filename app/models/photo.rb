class Photo < ActiveRecord::Base

	serialize :properties, JSON

=begin 
	before_save				JsonWrapper.new( :properties )
	after_save				JsonWrapper.new( :properties )
	
	def after_find
		self.properties = JsonWrapper.decrypt self.properties		
	end
=end


end