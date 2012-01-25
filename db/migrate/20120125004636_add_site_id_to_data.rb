class AddSiteIdToData < ActiveRecord::Migration
  def change
    change_table :data do |t|
      t.references :site
    end
  end
end
