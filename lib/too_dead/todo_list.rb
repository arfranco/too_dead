module TooDead
  class TodoLists < ActiveRecord::Base

    attr_writer :todo_items

    has_many :todo_items
    belongs_to :users
  end
  
end
