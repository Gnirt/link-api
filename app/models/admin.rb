class Admin < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users, -> { uniq }

  validates :name, presence: true
end
