require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"

class Motorista < ActiveRecord::Base;
    has_many :carros    
    has_one :carteira
end
