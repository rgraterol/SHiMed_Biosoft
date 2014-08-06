class Usuario < ActiveRecord::Base
  actable as: :es_usuario

  enum tipo_actor: { paciente: 0, medico: 1, centrosalud: 2, aseguradora: 3, farmacia: 4, centroexamenes: 5 }

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :create_session_token



  has_secure_password




  #=============================================================
  #======================== REGISTRO ============================

  def Usuario.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Usuario.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def Usuario.new_session_token
    SecureRandom.urlsafe_base64
  end

  def Usuario.digest_session(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  #=============================================================
  #======================== PRIVATE ============================
  private
    def create_remember_token
      self.remember_token = Usuario.digest(Usuario.new_remember_token)
    end

    def create_session_token
      self.remember_token = Usuario.digest(Usuario.new_remember_token)
    end

end
