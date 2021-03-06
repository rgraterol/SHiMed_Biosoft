Rails.application.routes.draw do

  resources :centro_examenes

  resources :pacientes

  resources :centro_saluds

  resources :farmacia

  resources :aseguradoras

  resources :medicos

  resources :personas

  resources :usuarios

  resources :especialidads

  root 'static#index', as: 'index'

  #Statics
  get '/index/' => 'static#index'

  #Registro
  get '/mailcheck/' => 'static#mailcheck', as: :mailcheck
  get '/mailchecked/:id' => 'usuarios#registro_inicio', as: :phase1
  get '/new_user/:remember_token' => 'usuarios#pre_process', as: :pre_pro

  #Sessions
  #match '/signin/', to: 'sessions#signin', via: 'get'
  get '/signin/' => 'session#signin', as: :signin
  post '/signin/session/' => 'session#create', as: :sessions
  delete '/sign_out' => 'session#destroy', as: :session_destroy

  #Usuarios
  get '/perfil_aux/' => 'usuarios#usuario_perfil', as: :usuario_perfil

  #Paciente
  get '/paciente/perfil/' => 'pacientes#show', as: :show_paciente

  #Medico
  get '/medico/perfil/' => 'medicos#show', as: :show_medico


end
