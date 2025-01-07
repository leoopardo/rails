class HomeController < ApplicationController
  def index
    puts "-------------------- Home controller chamando o job ---------------------"
    (1..5).to_a.each do |number|
          sleep 1
          SendEmailJob.perform_later
    end
    puts "-------------------- Home controller terminou o job ---------------------"
    @message = "Hello, World!"
  end
end
