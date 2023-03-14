class MovieRecommendation < ApplicationRecord
  belongs_to :movie
  belongs_to :giver, foreign_key: 'giver_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
end
