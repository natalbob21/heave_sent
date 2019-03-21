class PublicEventsController < ApplicationController
    skip_before_action :authenticate_user!

    def show
        @event = Event.find_by(uuid: params[:id])
    end
end