class AddTagToData < ActiveRecord::Migration
  def change
    add_column :data, :tag, :string

  end
end
