class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.text :content

      t.timestamps
    end
  end
end
