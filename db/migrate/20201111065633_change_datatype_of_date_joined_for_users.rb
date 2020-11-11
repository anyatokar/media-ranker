class ChangeDatatypeOfDateJoinedForUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :date_joined, :string
  end
end