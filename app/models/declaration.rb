class Declaration < ApplicationRecord
  validates :what, :why, :time, :score, presence: true

  belongs_to :user
end
