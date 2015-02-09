class AddCompletionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completion, :boolean, :default => false
  end
end
