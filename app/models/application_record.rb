class ApplicationRecord < ActiveRecord::Base
  after_commit :change_hauler_status
  primary_abstract_class

  private

  def change_hauler_status
    return if self.class == Hauler
    return if self.class == Admin
    
    hauler = self.hauler
    return if hauler.vehicles.empty?
    return if hauler.prices.empty?
    return if hauler.delivery_dates.empty?
    return if hauler.users.empty?

    hauler.active!
  end
end
