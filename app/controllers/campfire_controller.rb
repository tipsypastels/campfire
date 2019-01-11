class CampfireController < ApplicationController
  def index
    @messages = Message.all
  end
end
