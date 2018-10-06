# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180914003109) do

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 25, null: false
    t.string "apellido", limit: 25, null: false
    t.string "nro_documento", limit: 15, null: false
    t.date "nacimiento", null: false
    t.string "nacionalidad", limit: 50
    t.string "direccion", limit: 200
    t.string "telefono", limit: 20
    t.string "sexo", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nro_documento"], name: "index_clientes_on_nro_documento", unique: true
  end

  create_table "configuraciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre_empresa", limit: 50, null: false
    t.string "nombre_fantasia", limit: 50
    t.string "logo_path", limit: 100
    t.string "ruc", limit: 11
    t.string "direccion", limit: 100
    t.string "telefono", limit: 20
    t.integer "timbrado_id", null: false
    t.integer "moneda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_factura_ventas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "factura_venta_id", null: false
    t.integer "medicamento_id", null: false
    t.integer "cantidad", null: false
    t.decimal "exenta", precision: 7, scale: 2, default: "0.0", null: false
    t.decimal "iva5", precision: 7, scale: 2, default: "0.0", null: false
    t.decimal "iva10", precision: 7, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_factura_ventas_tmp", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "medicamento_id", null: false
    t.integer "cantidad", null: false
    t.decimal "exenta", precision: 7, scale: 2, default: "0.0", null: false
    t.decimal "iva5", precision: 7, scale: 2, default: "0.0", null: false
    t.decimal "iva10", precision: 7, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_movimiento_stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "movimiento_stock_id", null: false
    t.integer "medicamento_id", null: false
    t.integer "cantidad", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empleados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 25, null: false
    t.string "apellido", limit: 25, null: false
    t.date "fecha_ingreso", null: false
    t.date "fecha_salida"
    t.string "nro_documento", limit: 15, null: false
    t.date "fecha_nacimiento", null: false
    t.string "nacionalidad", limit: 50
    t.string "direccion", limit: 200
    t.string "telefono", limit: 20
    t.string "sexo", limit: 1, null: false
    t.boolean "activo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nro_documento"], name: "index_empleados_on_nro_documento", unique: true
  end

  create_table "error_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "class_name"
    t.text "message"
    t.text "trace"
    t.text "params"
    t.text "target_url"
    t.text "referer_url"
    t.text "user_agent"
    t.string "user_info"
    t.string "app_name"
    t.string "doc_root"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factura_ventas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "fecha", null: false
    t.integer "timbrado_id", null: false
    t.integer "cliente_id", null: false
    t.integer "empleado_id", null: false
    t.integer "moneda_id"
    t.string "nro_factura", limit: 15, null: false
    t.string "tipo_factura", limit: 10, default: "Contado", null: false
    t.decimal "total_exentas", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total_iva5", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total_iva10", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total", precision: 10, scale: 2, default: "0.0", null: false
    t.boolean "confirmado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ivas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "descripcion", limit: 7, null: false
    t.decimal "valor", precision: 3, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 35, null: false
    t.string "descripcion", limit: 60
    t.date "fecha_vencimiento", null: false
    t.string "tipo_uso_ids", limit: 30, null: false
    t.integer "present_med_id", null: false
    t.integer "cant_comprimido", null: false
    t.integer "cant_st_min", null: false
    t.integer "cant_st_max", null: false
    t.integer "precio_compra", null: false
    t.integer "precio_venta", null: false
    t.integer "cod_iva"
    t.string "modo_aplicacion", limit: 20, null: false
    t.string "especificacion", limit: 100
    t.boolean "activo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monedas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "moneda", limit: 25, null: false
    t.string "simbolo", limit: 5
    t.integer "decimales", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movimiento_stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "empleado_id", null: false
    t.date "fecha", null: false
    t.string "tipo_movimiento", limit: 10, null: false
    t.string "descripcion", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presentacion_medicamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "descripcion", limit: 25, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "medicamento_id", null: false
    t.integer "cantidad", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicamento_id"], name: "index_stocks_on_medicamento_id", unique: true
  end

  create_table "timbrados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "timbrado", null: false
    t.string "serie", limit: 10, null: false
    t.integer "nro_desde", null: false
    t.integer "nro_hasta", null: false
    t.date "fecha_circulacion", null: false
    t.date "fecha_expiracion", null: false
    t.boolean "estado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timbrado"], name: "index_timbrados_on_timbrado", unique: true
  end

  create_table "tipo_usos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_uso", limit: 35, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "empleado_id", null: false
    t.string "username", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
