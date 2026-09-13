class Dumper < ApplicationRecord
	validates :slno , presence: true
	validates :model, presence: true
	validates :make, presence: true
	validates :location, presence: true

end
