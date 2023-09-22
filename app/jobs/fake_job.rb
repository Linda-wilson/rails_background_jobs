class FakeJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    puts "calling API for #{user.email}"
    sleep 3
    puts "I am done now!"
  end
end
