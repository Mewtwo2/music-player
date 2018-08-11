require "curb"
require "json"

c = Curl::Easy.http_post("https://accounts.spotify.com/api/token", "grant_type=client_credentials"
    ) do |curl|
      curl.headers['Authorization'] = 'Basic ' # I left out the client keys so it is not made public in git hub
    end

access_token = JSON.parse(c.body_str)["access_token"]

a = Curl::Easy.perform("https://api.spotify.com/v1/artists/0OdUWJ0sBjDrqHygGUXeCF") do |curl|
  curl.headers["Accept"] = "application/json"
  curl.headers["Content-Type"] = "application/json"
  curl.headers["Authorization"] = "Bearer #{access_token}"
  curl.verbose = true
end
