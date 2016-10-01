require 'net/http'
require 'uri'
require 'json'

class HTTP::ForSatoshi
  def self.call(user:, password:, url:, request_body:)
    uri = URI.parse(url)
    request = Net::HTTP::Patch.new(uri)
    request.basic_auth(user, password)
    request.content_type = "application/json"
    request.body = JSON.dump(request_body)

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
      http.request(request)
    end

    response
  end
end
# curl -X GET 'https://hackathon.postbank.de/bank-api/gold/postbankid/' -H "API-Key: 485431370021fc32" -H "Device-Signature: 485431370021fc32" -H "X-AUTH: 0000015780fae78ddd41dff1f95b6d6338110386bc9a746d_gold_ls00805y"
