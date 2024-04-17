$:.push './'
require 'rubygems'
require 'active_record'
require 'models/multa.rb'


ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"
def inicia_multas
    if !ActiveRecord::Base.connection.table_exists?(:multas)    
        ActiveRecord::Base.connection.create_table :multas do |t|
            t.string :descricao
            t.float :valor
        end
    end
end

inicia_multas