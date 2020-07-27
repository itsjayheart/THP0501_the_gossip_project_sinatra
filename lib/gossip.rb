
require 'csv'

class Gossip

	attr_accessor :author, :content, :array

	def initialize(author, content)
		@author = author
		@content = content
		@array = [@author, @content]
	end

	def save

		CSV.open("db/all_gossips.csv", "ab") do |csv|
  			csv << @array
		end

	end

	def update(id, gossip_author, gossip_content)
		arr = Gossip.all
		arr.each do |gossip|
			if arr.index(gossip) == id.to_i - 1
				gossip.author = gossip_author
				gossip.content = gossip_content
				gossip.array = [gossip.author, gossip.content]
			end
		end
		CSV.open("db/all_gossips.csv", "w") do |csv|
			csv << arr[0].array
		end
		arr.each do |gossip|
			if arr.index(gossip) > 0
				CSV.open("db/all_gossips.csv", "a") do |csv|
		  			csv << gossip.array
				end
			end	
		end
	end


	def self.find(id)
		return Gossip.all[id.to_i - 1]
	end

	def self.all

 		all_gossips = []

 		CSV.foreach("db/all_gossips.csv") do |row|
  			all_gossips << Gossip.new(row[0], row[1])
		end

		return all_gossips

	end


end


