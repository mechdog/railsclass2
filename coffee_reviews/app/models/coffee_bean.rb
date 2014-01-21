# app/models/coffee_bean.rb 
class CoffeeBean < ActiveRecord::Base
  belongs_to :roaster
  belongs_to :origin
  has_one :tasting_note

  validates :name, presence: true
  validates :roasted_on, presence: true,
                if: :roaster_present?

  private

  def initialize_tasting_note
    self.build_tasting_note
  end

  def tasting_note_present?
    self.tasting.note.present?
  end

  def roaster_present?
      self.roaster.present?
  end
end
