class CreateUsersParties < ActiveRecord::Migration
  def change
    create_table :users_parties do |t|
      t.integer :user_id
      t.integer :party_id
      t.integer :voted, default: 1
      t.integer :votes_recieved, default: 0
      t.boolean :muderer, default: false    # murder value y/n

      t.timestamps
    end
  end
end
