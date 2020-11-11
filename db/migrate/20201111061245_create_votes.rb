class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :vote_id
      t.date :voted_on

      t.timestamps
    end
  end
end
