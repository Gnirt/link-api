class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://placehold.it/300"
  belongs_to :admin

  before_create :set_username
  # Remove dots and spaces from username
  before_save :format_username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  acts_as_messageable
  acts_as_token_authenticatable

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def mailboxer_email(object)
    email
  end

  private
    def set_username
      self.username = self.email[/^[^@]+/].gsub(".","")
    end

    def format_username
      self.username = self.username.gsub(".","").gsub(/\s+/,"") unless self.username.nil?
    end
end
