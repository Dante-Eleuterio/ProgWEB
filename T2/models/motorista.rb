#Dante Eleutério dos Santos GRR20206686
require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Tabelas.sqlite3"

class Motorista < ActiveRecord::Base;
    has_many :carros, dependent: :destroy
    has_one :carteira, dependent: :destroy
end
