class Music < ActiveRecord::Base
  BASE_MUSIC_URI = "https://api.spotify.com"

  # item_id string  Spotify-specific ID, which can be used in conjunction with the type to make calls to the Spotify API
  # type  string  Which type of resource this item is. Can be: artist, album, track, playlist
  # name  string  Name of the item
  # url string  URL for opening this item in a browser-based Spotify player
  # image_url string  URL of the photo to display for this item

end

