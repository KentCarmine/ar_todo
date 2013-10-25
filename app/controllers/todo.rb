require_relative '../models/task.rb'

class TodoUI

  def self.run!

    user_input = ARGV
    if user_input[0] == "list"
      list
    elsif user_input[0] == "add"
      add
    elsif user_input[0] == "delete"
      delete
    elsif user_input[0] == "complete"
      complete
    else
      puts "Error. Invalid command."
    end
  end

  def self.list
    puts Task.all
  end

  def self.add
    task_params = { :requirement => ARGV[1..-1].join(" "), :completed => false }
    Task.create(task_params)

    puts "Added \"#{task_params[:requirement]}\" to your TODO list."
  end

  def self.delete
    del_id = ARGV[1].to_i

    task_to_delete = Task.find_by_id(del_id)
    task_req = task_to_delete.requirement

    task_to_delete.destroy

    puts "Deleted \"#{task_req}\" from your TODO list."
  end

  def self.complete
    comp_id = ARGV[1].to_i
    task_to_complete = Task.find_by_id(comp_id)
    task_req = task_to_complete.requirement

    task_to_complete.completed = true

    task_to_complete.save

    puts "Completed task \"#{task_req}\"."
  end

end

TodoUI.run!
