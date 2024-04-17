require "rubygems"
require "active_record"

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"

ActiveRecord::Base.connection.create_table :carro do |t|
    t.string :placa 
    t.string :modelo
    t.string :ano
    t.references :motorista, foreign_key:true
end

