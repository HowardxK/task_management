class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all.order(created_at: :desc)
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to '/tasks', notice: "任務更新"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to '/tasks', notice: '任務刪除'
  end

  private
  def task_params
    params.require(:task).permit(:name, :content)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end
end
