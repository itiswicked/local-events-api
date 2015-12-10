require 'json'
require 'httparty'

date_begin = Time.now.strftime("%Y-%m-%d")
date_end = ( Time.now + (60 * 60 * 24) ).strftime("%Y-%m-%d")
city = 'Boston'
url = "http://api.seatgeek.com/2/events?format=json&venue.city="\
      "#{city}&datetime_local.gte=#{date_begin}&datetime_local.lte=#{date_end}"

response = HTTParty.get(url)

puts response['events'].map { |event|
  "#{event['title']} @ #{event['venue']['name']}"
}
