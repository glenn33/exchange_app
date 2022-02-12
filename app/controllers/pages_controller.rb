class PagesController < ApplicationController
  def home
    @exchange_rate = WesternUnionRequestService.call&.round(2)

  end

  private


end
