class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :bio
      t.string :password_hash

      t.timestamps
    end
  end
end


# Tie the USER ID to the cat.api?

#<img id="main_event" src="http://thecatapi.com/api/images/get?image_id">

#change the last part of the id and tied it to the user id

# http://thecatapi.com/api/images/get?image_id=1d1

