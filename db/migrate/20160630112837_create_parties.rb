class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :title
      t.string :password_hash

      t.timestamps
    end
  end
end

# All validations are stored in the model AR Base
