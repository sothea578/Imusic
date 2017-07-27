class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    drop_table :groups, if_exists: true
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end
    add_index :groups, :name
  end
end
