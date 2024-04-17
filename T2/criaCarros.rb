$:.push './'
require "rubygems"
require "active_record"
require 'models/carro.rb'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"
def inicia_carros
    if !ActiveRecord::Base.connection.table_exists?(:motoristas)         
        ActiveRecord::Base.connection.create_table :carro do |t|
            t.string :placa 
            t.string :modelo
            t.string :ano
            t.references :motorista, foreign_key:true
        end
    end
end

inicia_carros


