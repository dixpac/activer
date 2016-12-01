module Trackable
  extend ActiveSupport::Concern

   included do
    before_action :save_activity
   end

   private

   def save_activity
     page = self.class.name.gsub(/Controller/, '')
     action = self.action_name
     Activity.create(page: "Visited #{page}, executed #{action}")
   end
end
