class TasksController < ApplicationController
  #before_action :set_task, only: [:show, :edit, :update, :destroy]
  #before_filter :intercept_html_requests
  layout false
  respond_to :json

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    render json: @tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

      if @task.save
        render json: @task, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
   
  @task = Task.find(params[:id])

      if @task.update(task_params)
        head :no_content
      else
        render json: @task.errors, status: :unprocessable_entity
      end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

  end

  private


  def intercept_html_requests
    redirect_to('/') if request.format == Mime::HTML
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
      params.require(:task).permit(:content, :priority, :due, :messages, :percentage)
  end

end
