class PowerBank < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :station, optional: true
  belongs_to :warehouse, optional: true

  validates :charge, presence: true
  validates :status, presence: true

  before_save :update_status_based_on_user

  private

  def update_status_based_on_user
    if user_id.present?
      self.status = 'reserved'
    end
  end
end
