class SessionController < ApplicationController
  def signin
  end

  def create
    @usuario = Usuario.find_by(email: params[:session][:email].downcase)
    if @usuario && @usuario.authenticate(params[:session][:password])
      sign_in_permanent(@usuario)
      redirect_to @usuario
    else
      flash[:error] = 'Combinacion de Email/Password Invalido'
      redirect_to signin_path(@usuario)
    end
  end

  def destroy
    sign_out
    redirect_to index_path
  end
end
