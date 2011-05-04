class AddLastRepliedToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :last_replied, :datetime
  end

  def self.down
    remove_column :posts, :last_replied,
  end
end
