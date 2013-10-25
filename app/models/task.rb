require_relative '../../config/application.rb'

class Task < ActiveRecord::Base

  def to_s
    task_str = "#{id} - #{requirement}"
    if completed
      task_str += " - COMPLETE"
    end

    task_str
  end

end
