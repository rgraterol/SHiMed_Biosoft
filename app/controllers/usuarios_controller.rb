class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:pre_process]
  before_action :set_current_actor, only: [:usuario_perfil]

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
    if params[:usuario][:tipo_actor] == "paciente"
      @paciente = Paciente.new(usuario_params)
      respond_to do |format|
        if @paciente.save
          @usuario.remember_token=@paciente.remember_token
          send_mail(format)
        else
          wrong_register(format)
        end
      end
    end

    if params[:usuario][:tipo_actor] == "medico"
      @medico = Medico.new(usuario_params)
      respond_to do |format|
        if @medico.save
          @usuario.remember_token=@medico.remember_token
          send_mail(format)
        else
          wrong_register(format)
        end
      end
    end

    if params[:usuario][:tipo_actor] == "centrosalud"
      @centro_salud = CentroSalud.new(usuario_params)
      respond_to do |format|
        if @centro_salud.save
          @usuario.remember_token=@centro_salud.remember_token
          send_mail(format)
        else
          wrong_register(format)
        end
      end
    end

    if params[:usuario][:tipo_actor] == "aseguradora"
      @aseguradora = Aseguradora.new(usuario_params)
      respond_to do |format|
        if @aseguradora.save
          @usuario.remember_token=@aseguradora.remember_token
          send_mail(format)
        else
          wrong_register(format)
        end
      end
    end

    if params[:usuario][:tipo_actor] == "farmacia"
      @farmacium = Farmacium.new(usuario_params)
      respond_to do |format|
        if @farmacium.save
          @usuario.remember_token = @farmacium.remember_token
          send_mail(format)
        else
          wrong_register(format)
        end
      end
    end

    if params[:usuario][:tipo_actor] == "centroexamenes"
      @centro_examenes = CentroExamenes.new(usuario_params)
      respond_to do |format|
        if @centro_examenes.save
          @usuario.remember_token = @centro_examenes.remember_token
          send_mail(format)
        else
          wrong_register(format)
        end
      end
    end
  end

  #Envio del mail de registro
  def send_mail(format)
    if MailSender.sended(@usuario).deliver
      format.html { redirect_to mailcheck_path }
    end
  end

  #Mal Registro
  def wrong_register(format)
    @usuario.errors.each do |name_, erro|
      flash[name_] = erro
    end
    format.html { redirect_to new_usuario_path(@usuario) }
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

  def usuario_perfil
    if !@paciente.nil?
      redirect_to @paciente
    end

    if !@medico.nil?
      redirect_to @medico
    end

    if !@centro_salud.nil?
      redirect_to @centro_salud
    end

    if !@aseguradora.nil?
      redirect_to @aseguradora
    end

    if !@farmacium.nil?
      redirect_to @farmacium
    end

    if !@centro_examenes.nil?
      redirect_to @centro_examenes
    end
  end


  def pre_process
    #redirect_to phase1_path(@usuario.id)
    if !signed_in?
      sign_in_permanent(@usuario)
    end
    set_current_actor

    if !@paciente.nil?
      redirect_to edit_paciente_path(@paciente)
    end

    if !@medico.nil?
      redirect_to edit_medico_path(@medico)
    end

    if !@centro_salud.nil?
      redirect_to edit_centro_salud_path(@centro_salud)
    end

    if !@aseguradora.nil?
      redirect_to edit_aseguradora_path(@aseguradora)
    end

    if !@farmacium.nil?
      redirect_to edit_farmacium_path(@farmacium)
    end

    if !@centro_examenes.nil?
      redirect_to edit_centro_examene_path(@centro_examenes)
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
