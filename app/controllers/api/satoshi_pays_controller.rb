class Api::SatoshiPaysController < ApplicationController
  def index
    resp = SatoshiPay::Authenticate.call
    render json: resp.body
  end
end
