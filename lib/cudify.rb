require "cudify/version"

# User: TsaiKoga
# Params: rec 
# For example: 
# { :id => 1, ..., :_destroy => 1 } this record will be delete
# { :id => 2, ..., :_destroy => 0 } || { :id => 2, ... } these records will be updated
# { :id => nil, ... } || { name: "TsaiKoga", sex: "man", ... } these records will be created
module Cudify

	def cudify! rec
		define_cudify :cudify!, rec
	end

	def cudify rec
		define_cudify :cudify, rec
	end

	def define_cudify(name, rec)
		# At first, parameters hash become array
		array = (rec.is_a?(Array) ? rec : [rec])
		records = []

		# Secondly, records are created, updated or deleted
		transaction do
			array.each do |hash|
				if hash[:id] == nil then
					make = ( name == :cudify ? :create : :create! )
					hash[:_destroy].to_i == 1 ? next : (record = send(make,hash))
					records.push(record)
				else
					if hash[:_destroy].to_i == 1 then
						del = ( name == :cudify ? :delete : :destroy )
						find(hash[:id]).nil? ? raise : find(hash[:id]).send(:destroy)
					else
						hash = hash.slice!(:_destroy)
						find(hash[:id]).nil? ? raise : find(hash[:id]).update_attributes!(hash)
						records.push(find(hash[:id]))
					end
				end
			end
		end
		# At last, return the records what are created or updated
		return records.compact
	end
end

class ActiveRecord::Base
	extend Cudify
end
