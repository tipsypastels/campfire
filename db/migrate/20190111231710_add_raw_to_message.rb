class AddRawToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :raw, :boolean, default: false
  end
end
