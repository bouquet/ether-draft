class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :login_name

  has_many :posts
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :replies
  has_attached_file :avatar,
  :default_url => "/images/user_avatars/default/:style.:extension",
  :path => ":rails_root/public/images/user_avatars/:id/:style.:extension",
  :url => "/images/user_avatars/:id/:style.:extension", :styles => {
    :large => ["114x114>", :png],
    :normal => ["88x88>", :png],
    :small  => ["68x68>", :png]
  }

  validates_presence_of :login_name
  validates_length_of :login_name, :within => 4..16
  validates_uniqueness_of :login_name
  validates_attachment_size :avatar, :less_than => 640.kilobytes
  validates_attachment_content_type :avatar, :content_type => [
    "image/jpeg", "image/png", "image/gif"
  ]

  def member?(group)
    group.user_ids.include?(self.id)
  end
end
