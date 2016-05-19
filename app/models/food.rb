require 'httparty'

class Food
  BASE_FOOD_URI = "https://api.yelp.com/v2/business/"

  # Using BFU, concatenating business_id should deliver info about the chosen restaurant

  def initialize(data)
    @business_id = data["business_id"]
    @name = data["name"]
    @url = data["url"]
    @image_url = data["image_url"]
    @phone = data["phone"]
    @rating = data["rating"]
  end

  def self.find(business_id)
    data = HTTParty.get(BASE_FOOD_URI + "#{business_id}").parsed_response

    self.new(data)
  end

  # business_id string  Yelp-specific ID, which can be used to make calls to the Yelp Business API to retrieve complete details
  # name  string  Name of the business
  # url string  Yelp URL for this business
  # image_url string  URL of the photo to display for this business
  # phone string  Phone number for the business
  # rating  decimal number  Average rating for this business based on Yelp reviews

end
