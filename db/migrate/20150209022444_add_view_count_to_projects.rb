class AddViewCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :view_count, :integer
  end
end
