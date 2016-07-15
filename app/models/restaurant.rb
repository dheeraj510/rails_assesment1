require "data_fetch/main.rb"
class Restaurant
  class << self

    def fetch_data
    	# DataFetch::Main.get_restaurents['businesses'] will load all the restaurants from lib
	    restaurants =  DataFetch::Main.get_restaurents['businesses']

	    # Creating array of hash for all restaurants with required data like name, review_count, address, avg_rating
		restaurant_ary = restaurants.map do |restaurant|
			{
				name: restaurant["name"],
				review_count: restaurant["review_count"],
				address: {
					latitude: restaurant["latitude"],
					longitude: restaurant["longitude"],
					city: restaurant["city"], 
					state: restaurant["state"], 
					zip_code: restaurant["zip"]
				},
				avg_rating: restaurant["avg_rating"]
			}
		end

		# Ordering restaurant_ary with review_count.
		restaurant_ary.sort_by { |hsh| hsh[:review_count]}.reverse
    end

  end
end
