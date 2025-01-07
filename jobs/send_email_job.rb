class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "-------------------- Job executado ---------------------"
    sleep 10
    puts "-------------------- Job finalizado ---------------------"
  end
end
