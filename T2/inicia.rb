require 'rubygems'
require 'active_record'
require 'models/carro_model.rb'
require 'models/carteira_model.rb'
require 'models/motorista_model.rb'
require 'models/multa_model.rb'

def inicia_carros
    if !ActiveRecord::Base.connection.table_exists?(:carro)         
        ActiveRecord::Base.connection.create_table :carro do |t|
            t.string :placa 
            t.string :modelo
            t.string :ano
            t.references :motorista
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
        end        
    end
end

def inicia_carteiras
    if !ActiveRecord::Base.connection.table_exists?(:carteira)         
        ActiveRecord::Base.connection.create_table :carteira do |t|
            t.string :numero
            t.string :categoria
            t.date :validade
            t.references :motorista
        end

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
end

def inicia_motoristas
    if !ActiveRecord::Base.connection.table_exists?(:motorista)         
        ActiveRecord::Base.connection.create_table :motorista do |t|
            t.string :nome
            t.integer :idade
            t.string :sexo
            t.string :cpf
        end

        lista_motoristas = [
            {:nome=> "João", :idade => 30, :sexo => "Masculino", :cpf => "123.456.789-10"},
            {:nome=> "Maria", :idade => 25, :sexo => "Feminino", :cpf => "987.654.321-21"},
            {:nome=> "José", :idade => 40, :sexo => "Masculino", :cpf => "456.789.123-32"}
        ]
    
        lista_motoristas.each do |m|
            motorista = Motorista.new ()
            motorista.nome      = m[:nome]
            motorista.idade     = m[:idade]
            motorista.sexo      = m[:sexo]
            motorista.save
        end        
    end
end

def inicia_multas
    if !ActiveRecord::Base.connection.table_exists?(:multa)         
        ActiveRecord::Base.connection.create_table :multa do |t|
            t.string :descricao
            t.float :valor
        end

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
end


def inicia_carros_multas
    if !ActiveRecord::Base.connection.table_exists?(:alunos_materia)         
        ActiveRecord::Base.connection.create_table :carros_multas, id: false do |t|
            t.references :carro
            t.references :multa
        end
        
        id=1
        carros = Carro.all
        m = Multa.find_by_id(id)
        carros[1].multas << Multa.find_by_id(1)
        carros[1].multas << Multa.find_by_id(2)
        carros[2].multas << Multa.find_by_id(2)
        carros[2].multas << Multa.find_by_id(3)
        carros[3].multas << Multa.find_by_id(1)
        carros[3].multas << Multa.find_by_id(2)
        carros[3].multas << Multa.find_by_id(3)
        carros[4].multas << Multa.find_by_id(3)

    end
end



# Garante que tabela está criada e a popula para testes 
def inicia_ambiente

    ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                            :database => "Tabelas.sqlite3"

    inicia_carros
    inicia_carteiras
    inicia_motoristas
    inicia_multas
    inicia_carros_multas

end
