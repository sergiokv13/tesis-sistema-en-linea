# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Usuario.create(email:"encargado@votacion.com", password:'encargado', rol: 'Encargado de votacion')


Votacion.create(razon:"Votación para presidente",numero_maximo_votantes: 100, inicio: DateTime.now, finalizacion: DateTime.now, balotas: 1)

Departamento.create(nombre:"Cochabamba", nombre_encargado: "Sergio Koller Vargas",votacion_id:1, )
#Departamento.create(nombre:"La Paz", nombre_encargado: "Carolina Cortez Freudenthal",votacion_id:1)


Sector.create(nombre:"cbbas1", nombre_encargado: "Carlos Vargas",departamento_id:1)

#Sector.create(nombre:"LP1", nombre_encargado: "Jhon Doe Lero",departamento_id:2)

#Sector.create(nombre:"SC1", nombre_encargado: "Jhon Doe Lero",departamento_id:3)

#Sector.create(nombre:"TRJ1", nombre_encargado: "Jhon Doe Lero",departamento_id:4)



Recinto.create(nombre:"recbbas1", nombre_encargado: "Pepe Palotes",sector_id:1)

#Recinto.create(nombre:"reLP1", nombre_encargado: "Jhon Doe Lero",sector_id:2)

#Recinto.create(nombre:"reSC1", nombre_encargado: "Jhon Doe Lero",sector_id:3)

#Recinto.create(nombre:"reTRJ1", nombre_encargado: "Jhon Doe Lero",sector_id:4)


Mesa.create( nombre_encargado: "Ricardo Koller",recinto_id:1)

#Mesa.create( nombre_encargado: "Jhon Doe Lero",recinto_id:2)

#Mesa.create( nombre_encargado: "Jhon Doe Lero",recinto_id:3)
#Mesa.create( nombre_encargado: "Jhon Doe Lero",recinto_id:4)


Partido.create(nombre:"Partido1",informacion:"Este es el partido #1",votacion_id:1, color:"#ff3333", color_secundario:"#80ffff")
Partido.create(nombre:"Partido2",informacion:"Este es el partido #2",votacion_id:1, color:"#b36b00", color_secundario:"#b3ffff")
Partido.create(nombre:"Partido3",informacion:"Este es el partido #3",votacion_id:1, color:"#734d26", color_secundario:"#ebfafa")

Opcion.create(nombre:"Evo Morales", informacion:"Lorem Ipsum", partido_id:1)

Opcion.create(nombre:"Samuel Doria Medina", informacion:"Lorem Ipsum", partido_id:2)

Opcion.create(nombre:"Carlos Mesa", informacion:"Lorem Ipsum", partido_id:3)




