class Declaration < ApplicationRecord
  validates :what, :why, :time, :score, :user_id, :start, :end, presence: true

  belongs_to :user
end
