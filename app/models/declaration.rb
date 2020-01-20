class Declaration < ApplicationRecord
  validates :what, :why, :time, presence: true
end
