# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Usuario.create(email:"encargado@votacion.com", password:'encargado', rol: 'Encargado de votacion')


Votacion.create(razon:"Votación del presidente",numero_maximo_votantes: 100, tiempo_maximo_votos: 0, inicio: DateTime.now, finalizacion: DateTime.now, balotas: 2)

Departamento.create(nombre:"Cochabamba",numero_maximo_votantes: 0, nombre_encargado: "Sergio Koller Vargas",votacion_id:1, )
Departamento.create(nombre:"La Paz",numero_maximo_votantes: 0, nombre_encargado: "Carolina Cortez Freudenthal",votacion_id:1)
Departamento.create(nombre:"Santa Cruz",numero_maximo_votantes: 0, nombre_encargado: "Gonzalo Vilar Quiroga",votacion_id:1)
Departamento.create(nombre:"Tarija",numero_maximo_votantes: 0, nombre_encargado: "Santiago Quiroga Turdera",votacion_id:1)


Sector.create(nombre:"cbbas1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",departamento_id:1)

Sector.create(nombre:"LP1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",departamento_id:2)

Sector.create(nombre:"SC1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",departamento_id:3)

Sector.create(nombre:"TRJ1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",departamento_id:4)



Recinto.create(nombre:"recbbas1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",sector_id:1)

Recinto.create(nombre:"reLP1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",sector_id:2)

Recinto.create(nombre:"reSC1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",sector_id:3)

Recinto.create(nombre:"reTRJ1",numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",sector_id:4)


Mesa.create(numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",recinto_id:1)

Mesa.create(numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",recinto_id:2)

Mesa.create(numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",recinto_id:3)
Mesa.create(numero_maximo_votantes: 0, nombre_encargado: "Jhon Doe Lero",recinto_id:4)


Partido.create(nombre:"Partido1",informacion:"Este es el partido #1",votacion_id:1, color:"#ff3333", color_secundario:"#80ffff")
Partido.create(nombre:"Partido2",informacion:"Este es el partido #1",votacion_id:1, color:"#b36b00", color_secundario:"#b3ffff")
Partido.create(nombre:"Partido3",informacion:"Este es el partido #1",votacion_id:1, color:"#734d26", color_secundario:"#ebfafa")
Partido.create(nombre:"Partido4",informacion:"Este es el partido #1",votacion_id:1, color:"#999900", color_secundario:"#e6e6ff")

Opcion.create(nombre:"Candidato 1 Partido 1", informacion:"Lorem Ipsum", partido_id:1)

Opcion.create(nombre:"Candidato 1 Partido 2", informacion:"Lorem Ipsum", partido_id:2)

Opcion.create(nombre:"Candidato 1 Partido 3", informacion:"Lorem Ipsum", partido_id:3)

Opcion.create(nombre:"Candidato 1 Partido 4", informacion:"Lorem Ipsum", partido_id:4)




