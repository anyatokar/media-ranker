class ChangeDatatypeOfDateForVotesToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :voted_on, :string
  end
end
