require 'httparty'
class Recipe 
	include HTTParty
	default_options.update(verify: false)
	def self.for(keyword)
		ENV['FOOD2FORK_KEY'] = "c078861e329df5486b62ce337ff15079"
		key_value = ENV['FOOD2FORK_KEY']
		hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
		base_uri "http://#{hostport}/api"
		default_params key: key_value, q:"search"
		format :json
		get("/search/", query: { q: keyword})["recipes"]
	end

end

