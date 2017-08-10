json.extract! departamento, :id, :nombre, :numero_maximo_votantes, :votacion_id, :created_at, :updated_at
json.url departamento_url(departamento, format: :json)
