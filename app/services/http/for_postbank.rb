require 'net/http'
require 'uri'

class HTTP::ForPostbank
  def self.call(url:, auth_token: nil)
    uri = URI.parse(url)
    request = auth_token ? Net::HTTP::Get.new(uri) : Net::HTTP::Post.new(uri)
    request["API-Key"] = ENV['PB_API_Key']
    request["Device-Signature"] = ENV['PB_Device_Sig']
    request["X-AUTH"] = auth_token if auth_token

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
      http.request(request)
    end

    response
  end
end
