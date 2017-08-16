Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  resources :opcions
  resources :partidos
  devise_for :usuarios
  resources :mesas
  resources :recintos
  resources :sectors
  resources :departamentos
  resources :votacions
  get 'welcome/index'
  get "/departamentos/generar_cuenta/:id" => "departamentos#generar_cuenta" 
  get "/sectors/generar_cuenta/:id" => "sectors#generar_cuenta" 
  get "/departamento/sectores/:id" => "sectors#departamento_index"
  get "/sector/recintos/:id" => "recintos#sector_index"
  get "/recintos/generar_cuenta/:id" => "recintos#generar_cuenta" 
  get "/recinto/mesas/:id" => "mesas#mesa_index"
  get "/mesas/generar_cuenta/:id" => "mesas#generar_cuenta" 
  get "/visualizar_papeleta" => "votacions#visualizar_papeleta"
  get "/habilitar_papeleta" => "votacions#habilitar_papeleta"
  get "/finalizar_voto/:id/:user_id" => "votacions#finalizar_voto"
  post "/habilitar_terminal" => "votacions#habilitar_terminal"
  get "partidos_index_json" => "partidos#index_json"
  get "opcions_index_json" => "opcions#index_json"
  get "votacion_show_json" => "votacions#show_json"
  get "deshabilitar_terminal" => "votacions#deshabilitar_terminal"
  get "/informar_direccion/:direccion" => "mesas#informar_direccion"
  get "/reporte_total" => "reportes#get_reporte_total"
  root "welcome#index"

end
