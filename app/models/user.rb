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
  has_many :reviews, dependent: :destroy
  after_create :default_lists

  def default_lists
    to_discover = List.new(name: "To discover")
    to_discover.user = self
    to_discover.save

    to_recommand = List.new(name: "To recommand")
    to_recommand.user = self
    to_recommand.save
  end
end
