class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  include PgSearch::Model
  multisearchable against: [:title, :description]
end
