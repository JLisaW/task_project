class TasksController < ProtectedController
  before_action :set_task, only: [:show, :update, :destroy]
  # before_acti on :validate_user

  # GET /tasks
  def index
    # @tasks = Task.all
  @tasks = current_user.tasks
    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    # @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_task
  # @task = current_user.tasks.find(params[:id])
  @task = Task.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
  params.require(:task).permit(:user_id, :description)
  end
end
