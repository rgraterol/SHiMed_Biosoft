# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140806162116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aseguradoras", force: true do |t|
    t.string   "registro_go"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centro_saluds", force: true do |t|
    t.boolean  "publico"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ciudads", force: true do |t|
    t.string   "nombre"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", force: true do |t|
    t.string   "nombre"
    t.string   "rif"
    t.text     "direccion"
    t.text     "direccionFiscal"
    t.string   "telefono"
    t.string   "fax"
    t.string   "url"
    t.date     "fechaCreacion"
    t.integer  "ciudad_id"
    t.integer  "municipio_id"
    t.integer  "es_empresa_id"
    t.string   "es_empresa_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "especialidads", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farmacia", force: true do |t|
    t.string   "reg_sanitario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicos", force: true do |t|
    t.string   "cmv"
    t.text     "cv"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "municipios", force: true do |t|
    t.string   "nombre"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.text     "direccion"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "telefono_oficina"
    t.integer  "sexo"
    t.date     "fecha_nacimiento"
    t.integer  "es_persona_id"
    t.string   "es_persona_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rols", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_centro_saluds", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "tipo_actor",      default: 0
    t.integer  "rol_id",          default: 0
    t.string   "foto"
    t.integer  "es_usuario_id"
    t.string   "es_usuario_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "session_token"
  end

  add_index "usuarios", ["remember_token"], name: "index_usuarios_on_remember_token", using: :btree
  add_index "usuarios", ["session_token"], name: "index_usuarios_on_session_token", using: :btree

end
