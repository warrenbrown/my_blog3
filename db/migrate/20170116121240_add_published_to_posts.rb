class AddPublishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_on, :date
  end
end
