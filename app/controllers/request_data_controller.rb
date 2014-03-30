class RequestDataController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_request_datum, only: [:show, :edit, :update, :destroy]

  # GET /request_data
  # GET /request_data.json
  def index
    @request_data = RequestDatum.all
  end

  # GET /request_data/1
  # GET /request_data/1.json
  def show
  end

  # GET /request_data/new
  def new
    @request_datum = RequestDatum.new
  end

  # GET /request_data/1/edit
  def edit
  end

  # POST /request_data
  # POST /request_data.json
  def create
    @request_datum = RequestDatum.new(request_datum_params)

    respond_to do |format|
      if @request_datum.save
        format.html { redirect_to @request_datum, notice: 'Request datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_data/1
  # PATCH/PUT /request_data/1.json
  def update
    respond_to do |format|
      if @request_datum.update(request_datum_params)
        format.html { redirect_to @request_datum, notice: 'Request datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_data/1
  # DELETE /request_data/1.json
  def destroy
    @request_datum.destroy
    respond_to do |format|
      format.html { redirect_to request_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_datum
      @request_datum = RequestDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_datum_params
      # params.require(:request_datum).permit(:date, :client_id, :agent_id)
      params.require(:request_datum).permit!
    end
end
