class User < ActiveRecord::Base
  # validations
  validates :provider, presence: true # must be string: spotify
  validates :uid, presence: true # must be string
  validates :name, # if present must be string

end
