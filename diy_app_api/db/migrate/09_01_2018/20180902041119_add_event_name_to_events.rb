class AddEventNameToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :title, :text
  end
end