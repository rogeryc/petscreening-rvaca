class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy retrieve_breed_info ]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1 or /pets/1.json
  def show
    @breed_info = @pet.breed_info
  end

  # GET /pets/1/breed_info
  def retrieve_breed_info
    unless @pet.breed_info
      breed_data = BreedData.call(@pet.breed)

      return redirect_to pet_url(@pet), alert: "We couldn't find info related to this breed. Try again with a different breed name." unless breed_data

      @breed_info = BreedInfo.find_or_create_by(name: breed_data.name, min_life: breed_data.min_life, max_life: breed_data.max_life, description: breed_data.description, hypoallergenic: breed_data.hypoallergenic)
      @pet.update(breed_info: @breed_info)
    end

    redirect_to pet_url(@pet)
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_url(@pet), notice: "Pet was successfully created." }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: "Pet was successfully updated." }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy!

    respond_to do |format|
      format.html { redirect_to pets_url, notice: "Pet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.includes(:breed_info).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :kind, :breed, :weight, :owner_id)
    end
end
