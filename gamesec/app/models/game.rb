class Game < ActiveRecord::Base
	validates :name, :max_score, presence: true
end