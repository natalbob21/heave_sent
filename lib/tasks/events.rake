namespace :events do
    desc "looks for all unsent events that are to be sent today and sends them to their intended recipient"
    task :send_events => :environment do 
        Event.where(sent_at: nil).where("send_date <= ?", Date.today).each do |event|
            event.send_event
            event.update(sent_at: DateTime.now)
        end
    end
end
