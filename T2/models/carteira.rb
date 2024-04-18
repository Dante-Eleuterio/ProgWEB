#Dante Eleutério dos Santos GRR20206686
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"

class Carteira < ActiveRecord::Base;
    belongs_to :motorista
end
