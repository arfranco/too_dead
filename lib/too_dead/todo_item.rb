module TooDead
  class TodoItems < ActiveRecord::Base
    belongs_to :todo_lists
  end
end
