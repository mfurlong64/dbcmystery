class CreateUserParties < ActiveRecord::Migration
  def change
    create_table :user_parties do |t|
      t.integer :user_id
      t.integer :party_id
      t.integer :voted, default: 1
      t.integer :votes_recieved, default: 0
      t.boolean :murderer, default: false    # murder value y/n

      t.timestamps
    end
  end
end
