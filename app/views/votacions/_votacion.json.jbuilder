json.extract! votacion, :id, :razon, :inicio, :finalizacion, :numero_maximo_votantes, :numero_maximo_autenticaciones, :tiempo_maximo_votos, :created_at, :updated_at
json.url votacion_url(votacion, format: :json)
