class HoldingsController < ApplicationController
  before_action :set_holding, only: [:show, :edit, :update, :destroy]

  # GET /holdings
  # GET /holdings.json
  def index
    @holdings = Holding.all
  end

  # GET /holdings/1
  # GET /holdings/1.json
  def show
  end

  # GET /holdings/new
  def new
    @holding = current_user.holdings.build
  end

  # GET /holdings/1/edit
  def edit
  end

  # POST /holdings
  # POST /holdings.json
  def create
    @holding = current_user.holdings.build(holding_params)

    respond_to do |format|
      if @holding.save
        format.html { redirect_to @holding, notice: 'Holding was successfully created.' }
        format.json { render :show, status: :created, location: @holding }
      else
        format.html { render :new }
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holdings/1
  # PATCH/PUT /holdings/1.json
  def update
    respond_to do |format|
      if @holding.update(holding_params)
        format.html { redirect_to @holding, notice: 'Holding was successfully updated.' }
        format.json { render :show, status: :ok, location: @holding }
      else
        format.html { render :edit }
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  def get 
    holding = current_user.holdings.find_by_id(params[:id])
    if holding
      send_file holding.uploaded_file.path , :type => holding.uploaded_file_content_type
    else 
      flash[:error] = "Dont be Cheeky! Mind your assets "
    end 
  end 

  # DELETE /holdings/1
  # DELETE /holdings/1.json
  def destroy
    @holding.destroy
    respond_to do |format|
      format.html { redirect_to holdings_url, notice: 'Holding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holding
      @holding = current_user.holdings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holding_params
      params.require(:holding).permit(:name,:uploaded_file)
    end
end
