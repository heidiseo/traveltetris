namespace :city do
  desc "Creating cities"
  task create_all: :environment do
    CitiesJob.perform_now
  end
end
