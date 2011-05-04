class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :replies

  validates_presence_of :title
  validates_presence_of :content
  validates_length_of :title, maximum:64

  paginates_per 16
end
