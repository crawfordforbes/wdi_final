class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
        t.boolean :in_progress
    	t.integer :name
    	t.integer :max_score
    	t.text :rolls
    	t.integer :group_id
    	t.integer :winner
    	t.integer :turns
    	t.timestamps
    end
  end
end
