#Dante Eleutério dos Santos GRR20206686
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"

class Carro < ActiveRecord::Base;
    belongs_to :motorista
    has_and_belongs_to_many :multas, -> { distinct }
end
