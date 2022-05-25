class KittensController < ApplicationController
  before_action :set_kitten, only: %i[ show edit update destroy ]

  # GET /airports or /airports.json
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.xml  { render :xml => @kittens }
      format.json { render :json => @kittens }
    end
  end

  # GET /airports/1 or /airports/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  # GET /airports/new
  def new
    @kitten = Kitten.new
  end

  # GET /airports/1/edit
  def edit
  end

  # POST /airports or /airports.json
  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to kitten_url(@kitten), notice: "Kitten was successfully created." }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airports/1 or /airports/1.json
  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to kitten_url(@kitten), notice: "Kitten was successfully updated." }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airports/1 or /airports/1.json
  def destroy
    @kitten.destroy

    respond_to do |format|
      format.html { redirect_to kittens_url, notice: "Kitten was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
