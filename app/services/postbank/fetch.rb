class Postbank::Fetch
  def self.token(username, password)
    HTTP::ForPostbank.(url: "https://hackathon.postbank.de/bank-api/gold/postbankid/token?username=#{username}&password=#{password}")
  end

  def self.bank_info(token)
    HTTP::ForPostbank.(url: "https://hackathon.postbank.de:443/bank-api/gold/postbankid/", auth_token: token)
  end
end
