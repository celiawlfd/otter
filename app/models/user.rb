class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :photo, presence: true
  validates :username, length: { minimum: 3 }
  has_many :lists, dependent: :destroy
  has_many :list_books, through: :lists
  has_many :list_movies, through: :lists
  has_many :list_podcasts, through: :lists


  has_many :book_reviews, dependent: :destroy
  has_many :movie_reviews, dependent: :destroy
  has_many :podcast_reviews, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  after_create :default_lists

  has_many :received_movierecommendations, foreign_key: :receiver_id, class_name: 'MovieRecommendation'
  has_many :given_movierecommendations, foreign_key: :giver_id, class_name: 'MovieRecommendation'

  has_many :received_bookrecommendations, foreign_key: :receiver_id, class_name: 'BookRecommendation'
  has_many :given_bookrecommendations, foreign_key: :giver_id, class_name: 'BookRecommendation'

  has_many :received_podcastrecommendations, foreign_key: :receiver_id, class_name: 'PodcastRecommendation'
  has_many :given_podcastrecommendations, foreign_key: :giver_id, class_name: 'PodcastRecommendation'

  include PgSearch::Model
  # multisearchable against: [:username]
  pg_search_scope :search_by_title, against: :username,
  using: {
    tsearch: { prefix: true }
  }

  def default_lists
    require "open-uri"

    file = URI.open("https://w0.peakpx.com/wallpaper/452/896/HD-wallpaper-colorful-background-ultra-aero-colorful-beautiful-yellow-green-abstract-color-design-light-background-colors-bright-colourful-shades-vivid-soft-blur-gradient-pale-8k-lightcolored.jpg")
    to_discover = List.new(name: "To discover")
    to_discover.user = self
    to_discover.photo.attach(io: file, filename: "color.png", content_type: "image/png")
    to_discover.save

    to_recommend = List.new(name: "To recommend")
    to_recommend.user = self
    to_recommend.photo.attach(io: file, filename: "color.png", content_type: "image/png")
    to_recommend.save
  end

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end
end
