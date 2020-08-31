class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :platforms, :venues do |t|
      t.index [:platform_id, :venue_id]
      t.index [:venue_id, :platform_id]
    end
  end
end
