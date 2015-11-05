class AddImageLinkToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_link, :text
  end
end
