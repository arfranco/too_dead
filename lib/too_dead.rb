$LOAD_PATH.unshift(File.dirname(__FILE__))

require "too_dead/version"
require 'too_dead/init_db'
require 'too_dead/user'
require 'too_dead/todo_list'
require 'too_dead/todo_item'

require 'pry'
require 'vedeu'

module TooDead
  class Menu

    attr_reader :todo_lists

    def initialize
      @user = nil
    end

  def login
    puts "Welcome!"
    puts "\n\n"
    puts "Please enter your name: "
    result = gets.chomp
    until result =~ /^\w+$/
      puts "Please enter a name: "
      result = gets.chomp
    end
    @user = User.find_or_create_by(name: result)
  end

     def delete_list
      @todo_list.destroy
    end
    
    def choose_list
      puts "Start a new list (1) or view an existing list? (2)?"
      result = gets.chomp
      until result =~ /^[12]$/
        puts "Please choose a new list (1) or view an existing list (2)."
        result = gets.chomp
      end
      if result.to_i == 1
        @todo_list = @user.create_todo_list
      else
        @user.todo_list.where(user_id: @user.id).find_each do |todo_list|
          puts "#{todo_list.id} => Title: #{todo_list.title}"
      end
        puts "Please choose one of the numbered lists: "
        result = gets.chomp
        until result =~ /^\d+$/
          puts "Please pick a *numbered* list."
          result = gets.chomp
        end
        @todo_list = TodoList.find(result)
      end
    end
    binding.pry
  end
end
