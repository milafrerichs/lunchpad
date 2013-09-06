class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :venue, index: true
      t.datetime :preferred_lunch_time

      t.timestamps
    end
  end
end
