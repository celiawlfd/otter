class ListBook < ApplicationRecord
  belongs_to :list
  belongs_to :book
  validates :book, uniqueness: { scope: :list }
end
