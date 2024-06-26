#Dante Eleutério dos Santos GRR20206686
$:.push './'
require 'rubygems'
require 'active_record'
require 'models/carro.rb'
require 'models/carteira.rb'
require 'models/motorista.rb'
require 'models/multa.rb'

def inicia_carros
        ActiveRecord::Base.connection.create_table :carros do |t|
            t.string :placa 
            t.string :modelo
            t.string :ano
            t.references :motorista, foreign_key: true
        end
end

def inicia_carteiras
        ActiveRecord::Base.connection.create_table :carteiras do |t|
            t.string :numero
            t.string :categoria
            t.date :validade
            t.references :motorista, foreign_key: true
        end
end

def inicia_motoristas
        ActiveRecord::Base.connection.create_table :motorista do |t|
            t.string :nome
            t.integer :idade
            t.string :sexo
            t.string :cpf
        end
end

def inicia_multas
        ActiveRecord::Base.connection.create_table :multa do |t|
            t.string :descricao
            t.float :valor
        end
end

def inicia_carros_multa

    ActiveRecord::Migration.suppress_messages do
        ActiveRecord::Migration.create_table :carros_multa, id: false do |t|
          t.belongs_to :carro
          t.belongs_to :multa
        end
      end

end


def popula_motoristas
    lista_motoristas = [
        {:nome=> "João", :idade => 30, :sexo => "Masculino", :cpf => "123.456.789-10"},
        {:nome=> "Maria", :idade => 25, :sexo => "Feminino", :cpf => "987.654.321-21"},
        {:nome=> "José", :idade => 40, :sexo => "Masculino", :cpf => "456.789.123-32"}
    ]

    lista_motoristas.each do |m|
        motorista = Motorista.new()
        motorista.nome      = m[:nome]
        motorista.idade     = m[:idade]
        motorista.sexo      = m[:sexo]
        motorista.cpf      = m[:cpf]
        motorista.save
    end        

end


def popula_carros
    lista_carros = [
        {:placa=> "JRB2C20", :modelo => "Fiat Uno", :ano => "2010"},
        {:placa=> "ABC1D23", :modelo => "Volkswagen Gol", :ano => "2015"},
        {:placa=> "DEF4G56", :modelo => "Ford Fiesta", :ano => "2018"},
        {:placa=> "HIJ7K89", :modelo => "Chevrolet Onix", :ano => "2019"},
    ]

    lista_carros.each do |c|
        car = Carro.new ()
        car.placa    = c[:placa]
        car.modelo  = c[:modelo]
        car.ano     = c[:ano]
        car.save
    end

    mot = Motorista.find_by_id(1)
    c1 = Carro.find_by_id(1)    
    c2 = Carro.find_by_id(2)
    c1.motorista = mot
    c2.motorista = mot
    c1.save
    c2.save

    mot = Motorista.find_by_id(2)
    c3= Carro.find_by_id(3)
    c3.motorista = mot
    c3.save

    mot = Motorista.find_by_id(3)
    c4= Carro.find_by_id(4)
    c4.motorista = mot
    c4.save
end
 
def popula_carteiras
    lista_carteiras = [
        {:numero=> "12345", :categoria => "B", :validade => "2025-12-31"},
        {:numero=> "67890", :categoria => "A", :validade => "2024-08-15"},
        {:numero=> "54321", :categoria => "AB", :validade => "2023-11-20"}
    ]

    id=1
    lista_carteiras.each do |c|
        carteira = Carteira.new ()
        carteira.numero     = c[:numero]
        carteira.categoria  = c[:categoria]
        carteira.validade   = c[:validade]
        mot = Motorista.find_by_id(id)
        carteira.motorista = mot
        id+=1
        carteira.save
    end        
end

def popula_multas
    lista_multas = [
        {:descricao=> "Excesso de velocidade", :valor => 150.0},
        {:descricao=> "Estacionamento irregular", :valor => 100.0},
        {:descricao=> "Ultrapassagem em local proibido", :valor => 200.0}
    ]

    lista_multas.each do |m|
        multa = Multa.new ()
        multa.descricao     = m[:descricao]
        multa.valor         = m[:valor]
        multa.save
    end        
end

def popula_carros_multas
   carros = Carro.all
   multas = Multa.all
   carros[0].multas << multas[0]
   carros[0].multas << multas[1]
   carros[1].multas << multas[1]
   carros[1].multas << multas[2]
   carros[2].multas << multas[0]
   carros[2].multas << multas[1]
   carros[2].multas << multas[2]
   carros[3].multas << multas[2]
end

def popula_tudo
    popula_motoristas
    popula_carros
    popula_carteiras
    popula_multas
    popula_carros_multas
end


# Garante que tabela está criada e a popula para testes 
def inicia_ambiente

    ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                            :database => "Tabelas.sqlite3"

    inicia_carros
    inicia_carteiras
    inicia_motoristas
    inicia_multas
    inicia_carros_multa
    popula_tudo

end

inicia_ambiente
