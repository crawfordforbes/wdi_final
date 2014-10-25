class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :password_digest
    	t.integer :games_played
    	t.integer :games_won
    	t.timestamps
    end
  end
end
