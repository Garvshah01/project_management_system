class TasksController < ApplicationController

  before_action :load_task_by_id, only: [:edit, :update, :show]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: 'Task Created Successfully'
    else
      redirect_to root_path, alert: 'Task not created'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Logs created'
    else
      redirect_to task_path(@task), alert: 'logs not created'
    end
  end

  def show
    @logs = @task.logs
  end

  private def load_task_by_id
    @task = Task.find_by(id: params[:id])
  end

  private def task_params
    params.require(:task).permit(:description, :label_list, logs_attributes: [:assignee_id, :status]).tap do |param|
      param.logs_attributes.each do |log|
        log[:assignor_id] = current_user.id
      end
    end
  end

end
