class AddShowIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :comments, :show, index: true
  end
end
