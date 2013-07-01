module Geocoder
  module Worker
    class LookupWorker
      include Sidekiq::Worker

      def perform(class_name, id)
        target = class_name.constantize.find(id)
        target.geocode(:async => true)
      end
    end
  end
end
