class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :url
      t.boolean :processed, :default => false

      t.timestamps
    end
  end
end
