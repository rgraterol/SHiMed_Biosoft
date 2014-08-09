class CentroExamenesController < ApplicationController
  before_action :set_centro_examenes, only: [:show, :edit, :update, :destroy]

  # GET /centro_examenes
  # GET /centro_examenes.json
  def index
    @centros_examenes = CentroExamenes.all
  end

  # GET /centro_examenes/1
  # GET /centro_examenes/1.json
  def show
  end

  # GET /centro_examenes/new
  def new
    @centro_examenes = CentroExamenes.new
  end

  # GET /centro_examenes/1/edit
  def edit
  end

  # POST /centro_examenes
  # POST /centro_examenes.json
  def create
    @centro_examenes = CentroExamenes.new(centro_examenes_params)

    respond_to do |format|
      if @centro_examenes.save
        format.html { redirect_to @centro_examenes, notice: 'Centro examene was successfully created.' }
        format.json { render :show, status: :created, location: @centro_examenes }
      else
        format.html { render :new }
        format.json { render json: @centro_examenes.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centro_examenes/1
  # PATCH/PUT /centro_examenes/1.json
  def update
    respond_to do |format|
      if @centro_examenes.update(centro_examenes_params)
        format.html { redirect_to @centro_examenes, notice: 'Centro examene was successfully updated.' }
        format.json { render :show, status: :ok, location: @centro_examenes }
      else
        format.html { render :edit }
        format.json { render json: @centro_examenes.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centro_examenes/1
  # DELETE /centro_examenes/1.json
  def destroy
    @centro_examenes.destroy
    respond_to do |format|
      format.html { redirect_to centro_examenes_url, notice: 'Centro examene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centro_examenes
      @centro_examenes = CentroExamenes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def centro_examenes_params
      params.require(:centro_examenes).permit(:nombre, :rif, :direccion, :direccionFiscal, :telefono, :fax, :url, fecha_creacion_fixer(:centro_examenes))

    end
end
