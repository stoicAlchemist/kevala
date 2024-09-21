class Employee < ApplicationRecord
  belongs_to :location
  has_many :shifts

  enum :position, {
    rn: "rn",
    lpn: "lpn",
    cna: "cna"
  }
end
