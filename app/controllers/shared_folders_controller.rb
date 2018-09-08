class SharedFoldersController < ApplicationController
  before_action :set_shared_folder, only: [:show, :edit, :update, :destroy]

  # GET /shared_folders
  # GET /shared_folders.json
  def index
    @shared_folders = SharedFolder.all
  end

  # GET /shared_folders/1
  # GET /shared_folders/1.json
  def show
  end

  # GET /shared_folders/new
  def new
    @shared_folder = SharedFolder.new
  end

  # GET /shared_folders/1/edit
  def edit
  end

  # POST /shared_folders
  # POST /shared_folders.json
  def create
    @shared_folder = SharedFolder.new(shared_folder_params)

    respond_to do |format|
      if @shared_folder.save
        format.html { redirect_to @shared_folder, notice: 'Shared folder was successfully created.' }
        format.json { render :show, status: :created, location: @shared_folder }
      else
        format.html { render :new }
        format.json { render json: @shared_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shared_folders/1
  # PATCH/PUT /shared_folders/1.json
  def update
    respond_to do |format|
      if @shared_folder.update(shared_folder_params)
        format.html { redirect_to @shared_folder, notice: 'Shared folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @shared_folder }
      else
        format.html { render :edit }
        format.json { render json: @shared_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_folders/1
  # DELETE /shared_folders/1.json
  def destroy
    @shared_folder.destroy
    respond_to do |format|
      format.html { redirect_to shared_folders_url, notice: 'Shared folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_folder
      @shared_folder = SharedFolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shared_folder_params
      params.require(:shared_folder).permit(:user_id, :shared_email, :shared_user_id, :holding_id, :message)
    end
end
