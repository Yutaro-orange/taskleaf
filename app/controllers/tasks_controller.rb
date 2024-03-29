class TasksController < ApplicationController

  before_action :set_task, only: [:show, edit, :update, :destory]
  def index
    @tasks = current_user.tasks
  end

  def show
    @task = current_user.task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = current_user.task.find(params[:id])
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def update
    task = current_user.task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = current_user.task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
