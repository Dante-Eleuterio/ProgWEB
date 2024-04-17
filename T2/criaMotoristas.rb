$:.push './'
require 'rubygems'
require 'active_record'
require 'models/motorista.rb'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"

def inicia_motoristas
    if !ActiveRecord::Base.connection.table_exists?(:motoristas)         
        ActiveRecord::Base.connection.create_table :motorista do |t|
            t.string :nome
            t.integer :idade
            t.string :sexo
            t.string :cpf
        end
    end
end

inicia_motoristas