class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates_presence_of :content
  
  after_create :bump_post

  private

  def bump_post
    self.post.last_replied = self.created_at
    self.post.save
  end
end
