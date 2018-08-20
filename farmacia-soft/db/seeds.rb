# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user seeder create
@user=User.first()
if @user.blank?
	user = User.new(
        first_name: 'Diego Ramón',
	    last_name: 'Rodriguez Figueredo',
		username: 'Diego' ,
	    password: 'riper_010989'
        )
      user.save!
end

# timbrado seede create
@timbrado=Timbrado.first()
if @timbrado.blank?
	timbrado = Timbrado.new(
        timbrado: '123123',
	    serie: '101-101',
		nro_desde: 1000 ,
	    nro_hasta: 3000,
	    fecha_circulacion: Date.today,
	    fecha_expiracion: Date.today.year.to_s + '/12/31',
	    estado: 1
        )
      timbrado.save!
end
# configuracion  seeder create
@configuracion=Configuracion.first()
if @configuracion.blank?
	configuracion = Configuracion.new(
        nombre_empresa: 'Punto Farma',
	    nombre_fantasia: 'Punto Farma',
		logo_path: '/uploads/logo.png' ,
	    ruc: '80002502-2',
	    direccion: 'Avda. Caballero c/Carlos Antonio López',
	    telefono: '+595981526028',
        timbrado_id: Timbrado.first().id
        )
      configuracion.save!
end