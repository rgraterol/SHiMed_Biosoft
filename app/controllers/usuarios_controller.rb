class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:pre_process]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
         if MailSender.sended(@usuario).deliver
          format.html { redirect_to mailcheck_path }
         end
      else
         format.html { render :new }
         format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pre_process
    #redirect_to phase1_path(@usuario.id)
    if @usuario.tipo_actor=="paciente"
      redirect_to new_paciente_path(@usuario)
    end

    if @usuario.tipo_actor == "medico"
      redirect_to new_medico_path
    end

    if @usuario.tipo_actor == "centrosalud"
      redirect_to new_centro_salud_path
    end

    if @usuario.tipo_actor == "aseguradora"
      redirect_to new_aseguradora_path
    end

    if @usuario.tipo_actor == "farmacia"
      redirect_to new_farmacia_path
    end

    if @usuario.tipo_actor == "centroexamenes"
      redirect_to index_path
    end

  end

  def registro_inicio
    @usuario=Usuario.find(params[:id])
    if !signed_in?
      sign_in_permanent(@usuario)
    end
    if @usuario.tipo_actor==0
      redirect_to new_paciente_path
    end
  end



  #=============================================================
  #======================== PRIVATE ============================
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:email, :password, :password_confirmation, :tipo_actor)
    end

    def set_user
      @usuario = Usuario.find_by(remember_token: params[:remember_token])
    end

end
