class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :watches, :users
    add_foreign_key :watches, :projects
  end
end
