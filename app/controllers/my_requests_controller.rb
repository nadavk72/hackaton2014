class MyRequestsController < ApplicationController
  before_action :set_my_request, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /my_requests
  # GET /my_requests.json
  def index
    @my_requests = MyRequest.all #where('is_valid = false')
  end

  # GET /my_requests/1
  # GET /my_requests/1.json
  def show
  end

  # GET /my_requests/new
  def new
    @my_request = MyRequest.new
  end

  # GET /my_requests/1/edit
  def edit
  end

  # POST /my_requests
  # POST /my_requests.json
  def create
    @my_request = MyRequest.new(my_request_params)

    respond_to do |format|
      if @my_request.save
        format.html { redirect_to @my_request, notice: 'My request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @my_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @my_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_requests/1
  # PATCH/PUT /my_requests/1.json
  def update
    respond_to do |format|
      if @my_request.update(my_request_params)
        format.html { redirect_to @my_request, notice: 'My request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @my_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_requests/1
  # DELETE /my_requests/1.json
  def destroy
    @my_request.destroy
    respond_to do |format|
      format.html { redirect_to my_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_request
      @my_request = MyRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_request_params
      #params.require(:my_request).permit(:client_id, :agent_id)
      params.require(:my_request).permit!
    end
end
