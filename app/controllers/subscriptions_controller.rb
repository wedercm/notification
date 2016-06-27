class SubscriptionsController < ApplicationController
  def create
    binding.pry
    session[:subscription] = JSON.dump(params.fetch(:subscription, {}))
    head :ok
  end
end