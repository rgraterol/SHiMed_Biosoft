module SessionHelper

  def sign_in_permanent(usuario)
    session_token=Usuario.new_session_token
    cookies.permanent[:session_token]= session_token
    cookies.signed[:tipo_actor] = {
        :value => @usuario.tipo_actor,
        :secure => !(Rails.env.test? || Rails.env.development?)
    }
    usuario.update_attribute(:session_token, Usuario.digest_session(session_token))
    self.current_usuario=usuario
  end

  def current_usuario=(usuario)
    @current_usuario=usuario
  end

  def current_usuario
    session_token = Usuario.digest_session(cookies[:session_token])
    @current_usuario ||= Usuario.find_by(session_token: session_token)
  end

  def set_current_actor
    current_usuario
    tipo_actor = cookies.signed[:tipo_actor]
    if !tipo_actor.nil?
      session_token = @current_usuario.session_token
      if tipo_actor == "paciente"
        persona=Persona.find_by(session_token: session_token)
        @paciente = Paciente.find(persona.es_persona)
      end
      if tipo_actor == "medico"
        persona=Persona.find_by(session_token: session_token)
        @medico = Medico.find(persona.es_persona)
      end

      if tipo_actor == "centrosalud"
        empresa=Empresa.find_by(session_token: session_token)
        @centro_salud = CentroSalud.find(empresa.es_empresa)
      end

      if tipo_actor == "aseguradora"
        empresa=Empresa.find_by(session_token: session_token)
        @aseguradora=Aseguradora.find(empresa.es_empresa)
      end
      if tipo_actor == "farmacia"
        empresa=Empresa.find_by(session_token: session_token)
        @farmacium=Farmacium.find(empresa.es_empresa)
      end

      if tipo_actor == "centroexamenes"
        empresa=Empresa.find_by(session_token: session_token)
        @centro_examenes=CentroExamenes.find(empresa.es_empresa)
      end
    end
  end

  def signed_in?
    !current_usuario.nil?
  end

  def sign_out
    current_usuario.update_attribute(:session_token, Usuario.digest_session(Usuario.new_session_token))
    cookies.delete(:session_token)
    cookies.delete(:tipo_actor)
    self.current_usuario = nil
  end

  def signin_by_id_permanent
    usuario_id=Usuario.find_by(params[:id])
    session_token=Usuario.new_session_token
    cookies.permanent[:session_token]=session_token
    cookies.permanent[:tipo_actor]=usuario_id.tipo_actor
    usuario_id.update_attribute(:session_token, Usuario.digest_session(session_token))
    self.current_usuario=usuario_id
  end

=begin
  def set_usuario_from_current
    @usuario= current_usuario

    if @usuario.tipo_actor == "paciente"
      @paciente ||= Paciente.find_by(session_token: session_token)
    end
  end
=end

=begin
  def encrypt_cookie_tipo_actor(cookie)
    key = ActiveSupport::KeyGenerator.new('cookie').generate_key(generate_cookie_salt)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    @encrypted_cookie = crypt.encrypt_and_sign(cookie)
  end

  def decrypt_cookie(encrypted_cookie)
    key = ActiveSupport::KeyGenerator.new('cookie').generate_key(generate_cookie_salt)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    @decrypted_cookie = crypt.decrypt_and_verify(encrypted_cookie)
  end

  def generate_cookie_salt
    SecureRandom.random_bytes(8)
  end
=end
end
