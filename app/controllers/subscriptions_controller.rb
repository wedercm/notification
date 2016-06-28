class SubscriptionsController < ApplicationController
  def create
    session[:subscription] = params.fetch(:subscription, {})
    head :ok
  end
end