class UtilitySharing < ActiveRecord::Base
  PERMISSION_LEVELS = {
    'View only' => 'read',
    'View and add bills' => 'read_write'
  }.freeze

  belongs_to :utility
  belongs_to :user

  validates :utility, :user, :permission_level, presense: true
  validates :permission_level, inclusion: {in: PERMISSION_LEVELS}

end
