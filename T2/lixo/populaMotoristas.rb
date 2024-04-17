$:.push './'
require 'rubygems'
require 'active_record'
require 'models/motorista.rb'

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
        motorista.save
    end        
end

popula_motoristas