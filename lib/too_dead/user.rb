module TooDead

  class User < ActiveRecord::Base
    has_many :todo_lists

      attr_writer :todo_lists

    def self.create_todo_list
        @todo_list = TodoList.new
    end

  end
end
