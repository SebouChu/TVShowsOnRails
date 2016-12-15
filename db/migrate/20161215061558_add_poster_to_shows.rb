class AddPosterToShows < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :shows, :poster
  end

  def self.down
    remove_attachment :shows, :poster
  end
end
