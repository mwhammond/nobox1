class MessagesController < ApplicationController
 # before_action :set_message, only: [:show, :edit, :update, :destroy]
 # before_filter :intercept_html_requests
  layout false
  respond_to :json

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    render json: @messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    render json: @message
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

  
      if @message.save

        render json: @message, status: :created, location: @message

      else

        render json: @message.errors, status: :unprocessable_entity
 
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update

  @message = Message.find(params[:id])

  if @message.update_attribute(params[:message])
    head :no_content
  else
    render json: @message.errors, status:unprocessable_entity
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private

  def intercept_html_requests
    redirect_to('/') if request.format == Mime::HTML
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:to, :cc, :from, :message, :received)
    end
end
