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

ActiveRecord::Schema.define(version: 20170810101859) do

  create_table "departamentos", force: :cascade do |t|
    t.string "nombre"
    t.integer "votacion_id"
    t.string "nombre_encargado"
    t.integer "encargado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encargado_id"], name: "index_departamentos_on_encargado_id"
    t.index ["votacion_id"], name: "index_departamentos_on_votacion_id"
  end

  create_table "mesas", force: :cascade do |t|
    t.integer "recinto_id"
    t.string "nombre_encargado"
    t.string "estado"
    t.integer "encargado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "direccion"
    t.boolean "terminal_habilitada"
    t.index ["encargado_id"], name: "index_mesas_on_encargado_id"
    t.index ["recinto_id"], name: "index_mesas_on_recinto_id"
  end

  create_table "opcions", force: :cascade do |t|
    t.text "informacion"
    t.integer "partido_id"
    t.string "nombre"
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partido_id"], name: "index_opcions_on_partido_id"
  end

  create_table "partidos", force: :cascade do |t|
    t.string "nombre"
    t.text "informacion"
    t.integer "votacion_id"
    t.string "color"
    t.string "color_secundario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votacion_id"], name: "index_partidos_on_votacion_id"
  end

  create_table "recintos", force: :cascade do |t|
    t.string "nombre"
    t.integer "numero_maximo_votantes"
    t.integer "sector_id"
    t.string "nombre_encargado"
    t.integer "encargado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encargado_id"], name: "index_recintos_on_encargado_id"
    t.index ["sector_id"], name: "index_recintos_on_sector_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "nombre"
    t.integer "departamento_id"
    t.string "nombre_encargado"
    t.integer "encargado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_sectors_on_departamento_id"
    t.index ["encargado_id"], name: "index_sectors_on_encargado_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "rol"
    t.string "password_reset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "votacions", force: :cascade do |t|
    t.text "razon"
    t.datetime "inicio"
    t.datetime "finalizacion"
    t.integer "numero_maximo_votantes"
    t.string "etapa"
    t.boolean "informacion_conluida"
    t.integer "balotas"
    t.string "direccion_principal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
