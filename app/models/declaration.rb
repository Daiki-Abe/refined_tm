class Declaration < ApplicationRecord
  validates :what, :why, :time, :score, presence: true
end
