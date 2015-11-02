class CreateJoinTableLocationsStories < ActiveRecord::Migration
  def change
    create_join_table :locations, :stories do |t|
      # t.index [:location_id, :story_id]
      # t.index [:story_id, :location_id]
    end
  end
end
