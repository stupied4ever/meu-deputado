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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130501170524) do

  create_table "comissoes", :force => true do |t|
    t.text     "nome"
    t.string   "sigla"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "deputado_comissoes", :force => true do |t|
    t.integer  "deputado_id"
    t.integer  "comissao_id"
    t.string   "cadeira"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "deputados", :force => true do |t|
    t.integer  "ide_cadastro"
    t.integer  "matricula"
    t.integer  "id_parlamentar"
    t.string   "nome"
    t.string   "nome_parlamentar"
    t.string   "sexo"
    t.string   "uf"
    t.string   "partido"
    t.string   "gabinete"
    t.string   "anexo"
    t.string   "fone"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "presencas", :force => true do |t|
    t.string   "numero_sessao_legislativa"
    t.string   "sessao_legislativa"
    t.string   "sessao_numero"
    t.string   "sequencial_votacao"
    t.string   "nome_parlamentar"
    t.string   "partido"
    t.string   "uf"
    t.string   "codigo_parlamentar"
    t.string   "tipo_sessao"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "sessao_legislativa_ordinaria"
    t.string   "sessao_ordinaria"
    t.string   "presente"
  end

end
