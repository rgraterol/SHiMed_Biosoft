module SessionHelper

  def sign_in_permanent(usuario)
    session_token=Usuario.new_session_token
    cookies.permanent[:session_token]= session_token
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

  def signed_in?
    !current_usuario.nil?
  end

  def sign_out
    current_usuario.update_attribute(:session_token, Usuario.digest_session(Usuario.new_session_token))
    cookies.delete(:session_token)
    self.current_usuario = nil
  end

  def signin_by_id_permanent
    usuario_id=Usuario.find_by(params[:id])
    session_token=Usuario.new_session_token
    cookies.permanent[:session_token]=session_token
    usuario_id.update_attribute(:session_token, Usuario.digest_session(session_token))
    self.current_usuario=usuario_id
  end
end
