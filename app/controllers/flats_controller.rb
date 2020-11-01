require "open-uri"

class FlatsController < ApplicationController
  before_action :get_flats

  def index
  end

  def show
    # 2. Access the id from the params
    flat_id = params['id']

    # 3. Based on the id, find the flat
    @flat = @flats.find { |flat| flat['id'] == flat_id.to_i }
  end

  private

  def get_flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    @flats = JSON.parse(open(url).read)
  end
end
