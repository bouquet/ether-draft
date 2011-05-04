class Group < ActiveRecord::Base
  has_many :posts
  has_many :memberships
  has_many :users, :through => :memberships
  has_attached_file :icon,
  :default_url => "/images/group_icons/default/:style.:extension",
  :path => ":rails_root/public/images/group_icons/:id/:style.:extension",
  :url => "/images/group_icons/:id/:style.:extension", :styles => {
    :large => ["114x114>", :png],
    :normal => ["88x88>", :png],
    :small  => ["68x68>", :png]
  }

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 16
  validates_length_of :description, :maximum => 128
  validates_attachment_size :icon, :less_than => 640.kilobytes
  validates_attachment_content_type :icon, :content_type => [
    "image/jpeg", "image/png", "image/gif"
  ]
end
