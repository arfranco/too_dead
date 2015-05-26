class CreateTodoItems < ActiveRecord::Migration
  def up
    create_table :todo_items do |t|
      t.string :name
      t.datetime :duedate
      t.boolean :completed 
    end
  end

  def down
    drop_table :todo_items
  end
end