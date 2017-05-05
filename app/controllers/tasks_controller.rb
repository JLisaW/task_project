# frozen_string_literal: true
class TasksController < OpenReadController
  before_action :set_task, only: [:create, :read, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    render json: Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy

    head :no_content
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:text)
  end

  private :set_task, :task_params
end
