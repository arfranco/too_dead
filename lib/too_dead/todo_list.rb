module TooDead
  class TodoLists < ActiveRecord::Base

    attr_writer :todo_items

    has_many :todo_items, dependent: :destroy
    belongs_to :users
  end
  
end
