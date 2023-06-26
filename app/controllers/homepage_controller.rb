class HomepageController < ApplicationController

  def index
    @total_task = Task.all
    @task_completed = @total_task.where.not(status: :done)
  end

end
