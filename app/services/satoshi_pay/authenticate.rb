class SatoshiPay::Authenticate
  def self.call
    HTTP::ForSatoshi.(user: ENV['SATOSHI_PAY_KEY'], password: ENV['SATOSHI_PAY_SECRET'], url: "https://provider-api-testnet.satoshipay.io/v1/goods/558bcdbb1309c59725bdb559", request_body: {
      "secret" => ENV['SATOSHI_PAY_SECRET']
    })
  end
end
