class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :what
      t.string :where
      t.boolean :bought

      t.timestamps
    end
  end
end
