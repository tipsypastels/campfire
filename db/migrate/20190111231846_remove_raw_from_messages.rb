class RemoveRawFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :raw, :boolean
  end
end
