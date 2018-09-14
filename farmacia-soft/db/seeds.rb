# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user seeder create
# medicamento  seeder create
@empleado=Empleado.first()
if @empleado.blank?
	empleado = Empleado.new(
      nombre: 'Diego Ramon',
	    apellido: 'Rodriguez Figueredo',
		  fecha_ingreso: Date.today,
	    nro_documento: '4546837',
	    fecha_nacimiento: '01-09-1989',
      nacionalidad: 'Paraguaya',
			direccion: 'Barrio Santa Maria km 3 - Encarnacion',
			telefono: '(0981) 526028',
			sexo: 'M',
			activo: 1)
      empleado.save!

end

@user=User.first()
if @user.blank?
	user = User.new(
      emplaeado_id: Empleado.first().id,
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
      timbrado_id: Timbrado.first().id)
      configuracion.save!
end

# presentación de medicamento create seeder
@presen_med=PresentacionMedicamento.first()
if @presen_med.blank?
	presen_medicamentos =
	[
	  {
        descripcion: 'Capsulas',
      },
      {
        descripcion: 'Tabletas',
      },
      {
        descripcion: 'Envase',
      },
    ]
	presen_medicamentos.each do |presen_med|
       PresentacionMedicamento.new(presen_med).save
    end
end
# tipo uso de medicamento create seeder
@tipo_uso=TipoUso.first()
if @tipo_uso.blank?
	tipo_usos = [ {tipo_uso: 'Analgesico',} ,{tipo_uso: 'Antiinflamatorio',},{tipo_uso: 'Laxante',},{tipo_uso: 'Antialérgico', },
                  {tipo_uso: 'Antiácidos y antiulcerosos'},{tipo_uso: 'Antiinfecciosos'}, {tipo_uso: 'Antipiréticos'},
                  {tipo_uso: 'Antitusivos y mucolíticos'}, ]
	 tipo_usos.each do |tip_uso|
       TipoUso.new(tip_uso).save
     end
end
# medicamento  seeder create
@medicamento=Medicamento.first()
if @medicamento.blank?
	medicamento = Medicamento.new(
      nombre: 'Cefalgyn',
	    descripcion: '',
		  fecha_vencimiento: '08-03-2020',
	    tipo_uso_ids: [1,2],
	    present_med_id: 2,
	    cant_comprimido: 4,
      cant_st_min: 15,
			cant_st_max: 40,
			precio_compra: 3700,
			precio_venta: 4500,
			modo_aplicacion: 'Via Oral',
			especificacion: 'Dolores de Cabeza',
			activo: 1)
      medicamento.save!

end
