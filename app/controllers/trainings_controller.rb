class TrainingsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  layout 'admin'



  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    @training = Training.find(params[:id])
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
    @training = Training.find(params[:id])
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Training was successfully created.' }
        format.json { render action: 'show', status: :created, location: @training }
      else
        format.html { render action: 'new' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to '/branches/travelteam/training', notice: 'Training was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    Training.find(params[:id]).destroy
    flash[:success] = "Training session deleted."
    redirect_to admintools_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:date, topics_attributes: [:id, :committee, :topic,
                                                                  :image_url, :description,
                                                                  :guide_filename, :chair,
                                                                  :vice_chair, :training_id,
                                                                  :_destroy])

    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
