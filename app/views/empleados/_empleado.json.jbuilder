json.extract! empleado, :id, :nombre, :apellido, :edad, :email, :sede_id, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
