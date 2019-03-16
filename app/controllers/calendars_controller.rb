class CalendarsController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.json do
        start_date  = Date.parse(params[:start_date])
        end_date    = Date.parse(params[:end_date])
        tasks       = current_user.events.between(start_date, end_date).ordered
        render json: events.group_by{ |event| event.send_date }
      end
    end
  end
end
