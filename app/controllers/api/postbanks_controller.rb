class Api::PostbanksController < ApplicationController
  def index
    token = JSON.parse(Postbank::Fetch.token("HackathonSep22", "hat0814").body)["token"]
    resp = Postbank::Fetch.bank_info(token)
    render json: resp.body
  end

  private

  def postbank_token
    # hardcoded
    # username=HackathonSep22
    # password=hat0814
    Postbank::FetchToken.("HackathonSep22", "hat0814")
  end
end
