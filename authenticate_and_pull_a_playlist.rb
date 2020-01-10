require 'base64'
require 'rest-client'
require 'pry'

client_id = "ENTER IT HERE"
client_secret = "ENTER IT HERE"

client_token = Base64.strict_encode64(client_id + ":" + client_secret)
spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})
parsed_token = JSON.parse(spotify_token)


playlist = `curl -X GET "https://api.spotify.com/v1/playlists/6IdOXdDffInrQ00Uui0y6U" -H "Authorization: Bearer #{parsed_token["access_token"]}"`
puts playlist
binding.pry


