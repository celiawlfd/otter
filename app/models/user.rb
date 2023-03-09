class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, length: { minimum: 3 }
  has_many :lists, dependent: :destroy
  has_many :book_reviews, dependent: :destroy
  has_many :movie_reviews, dependent: :destroy

  after_create :default_lists

  def default_lists
    require "open-uri"
    
    file = URI.open("https://www.colorhexa.com/b8e1dd.png")
    to_discover = List.new(name: "To discover")
    to_discover.user = self
    to_discover.photo.attach(io: file, filename: "color.png", content_type: "image/png")
    to_discover.save

    to_recommand = List.new(name: "To recommand")
    to_recommand.user = self
    to_recommand.photo.attach(io: file, filename: "color.png", content_type: "image/png")
    to_recommand.save
  end
end
