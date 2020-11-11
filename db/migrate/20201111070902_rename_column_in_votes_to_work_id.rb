class RenameColumnInVotesToWorkId < ActiveRecord::Migration[6.0]
  def change
    rename_column :votes, :vote_id, :work_id
  end
end
