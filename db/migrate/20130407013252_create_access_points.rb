class CreateAccessPoints < ActiveRecord::Migration
  def change
    create_table :access_points do |t|
      t.string :ssid
      t.string :mac
      t.integer :channel
      t.integer :strength
      t.string :encryption_type
      t.string :ap_type
      t.datetime :first_seen
      t.datetime :last_seen

      t.timestamps
    end
  end
end
