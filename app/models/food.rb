class Food < ActiveRecord::Base

  # business_id string  Yelp-specific ID, which can be used to make calls to the Yelp Business API to retrieve complete details
  # name  string  Name of the business
  # url string  Yelp URL for this business
  # image_url string  URL of the photo to display for this business
  # phone string  Phone number for the business
  # rating  decimal number  Average rating for this business based on Yelp reviews

end
