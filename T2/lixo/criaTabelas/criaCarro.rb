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


lista_carros = [
            {:placa=> "JRB2C20", :modelo => "Fiat Uno", :ano => "2010"},
            {:placa=> "ABC1D23", :modelo => "Volkswagen Gol", :ano => "2015"},
            {:placa=> "DEF4G56", :modelo => "Ford Fiesta", :ano => "2018"},
            {:placa=> "HIJ7K89", :modelo => "Chevrolet Onix", :ano => "2019"},
        ]

        id=1
        lista_carros.each do |c|
            car = Carro.new ()
            car.nome    = c[:nome]
            car.modelo  = c[:modelo]
            car.ano     = c[:ano]
            mot = Motorista.find_by_id(id)
            car.motorista = mot
            id+=1
            car.save
