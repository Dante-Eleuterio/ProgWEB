$:.push './'
require 'prepara_ambiente.rb'

def printa_comandos
    puts "Lista de comandos:
    help    -> Lista comandos
    q       -> Termina o programa
-- operaçõs de tabela ----------------
 < operação > < tabela > { atributo = valor }
    insere 
    lista
    exclui" 
end

def insere_in (tabela, valores)
    case tabela.upcase
    when "CARRO", "CARROS"
        carro = Carro.new()

        valores.each do |c|
            if c.include?("placa=")
                value = m.split(/=/, 2)[1] 
                carro.placa = value
            end
            if c.include?("modelo=")
                value = m.split(/=/, 2)[1] 
                carro.modelo = value
            end
            if c.include?("ano=")
                value = m.split(/=/, 2)[1] 
                carro.ano = value
            end
        end

        carro.save

    when "CARTEIRA", "CARTEIRAS"
        carteira = Carteira.new()

        valores.each do |c|
            if c.include?("numero=")
                value = m.split(/=/, 2)[1] 
                carteira.numero = value
            end
            if c.include?("categoria=")
                value = m.split(/=/, 2)[1] 
                carteira.categoria = value
            end
            if c.include?("validade=")
                value = m.split(/=/, 2)[1] 
                carteira.validade = value
            end
        end
        carteira.save

    when "MOTORISTA", "MOTORISTAS"
        motorista = Motorista.new()

        valores.each do |m|
            if m.include?("nome=")
                value = m.split(/=/, 2)[1] 
                motorista.nome = value
            end
            if m.include?("idade=")
                value = m.split(/=/, 2)[1] 
                motorista.idade = value
            end
            if m.include?("sexo=")
                value = m.split(/=/, 2)[1] 
                motorista.sexo = value
            end
            if m.include?("cpf=")
                value = m.split(/=/, 2)[1] 
                motorista.cpf = value
            end
        end
        motorista.save
    when "MULTA", "MULTAS"
        multa = Animal.new()

        valores.each do |m|
            if m.include?("descricao=")
                value = m.split(/=/, 2)[1] 
                multa.descricao = value
            end
            if m.include?("valor=")
                value = m.split(/=/, 2)[1] 
                multa.valor = value
            end
        end

        multa.save
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

def exclui_from (tabela, valor)
    case tabela.upcase
    when "CARRO", "CARROS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] 
            carro = Carro.find_by_id(value.to_i)
        end
        if valor.include?("placa=")
            value = valor.split(/=/, 2)[1] 
            carro = Carro.find_by_placa(value.to_i)
        end
        if valor.include?("modelo=")
            value = valor.split(/=/, 2)[1] 
            carro = Carro.find_by_modelo(value)
        end
        if valor.include?("ano=")
            value = valor.split(/=/, 2)[1] 
            carro = Carro.find_by_ano(value)
        end
        if carro != nil
            carro.delete
        end 
    when "CARTEIRA", "CARTEIRAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.find_by_id(value.to_i)
        end
        if valor.include?("numero=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.find_by_numero(value)
        end
        if valor.include?("categoria=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.find_by_categoria(value)
        end
        if valor.include?("validade=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.find_by_validade(value)
        end
        if carteira != nil
            carteira.delete
        end

    when "MOTORISTA", "MOTORISTAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_id(value.to_i)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_nome(value)
        end
        if valor.include?("idade=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_idade(value)
        end
        if valor.include?("sexo=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_sexo(value)
        end
        if valor.include?("cpf=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_cpf(value)
        end
        if motorista != nil
            motorista.delete
        end

    when "MULTA", "MULTAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] 
            multa = Animal.find_by_id(value.to_i)
        end
        if valor.include?("descricao=")
            value = valor.split(/=/, 2)[1] 
            multa = Animal.find_by_descricao(value)
        end
        if valor.include?("valor=")
            value = valor.split(/=/, 2)[1] 
            multa = Animal.find_by_valor(value)
        end
        if multa != nil
            multa.delete
        end
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

def  lista_from (tabela)
    case tabela.upcase
    when "CARRO", "CARROS"
        carros = Carro.all
        carros.each do |c|
            puts "..................id:#{c.id} Placa: #{c.placa}, Modelo: #{c.modelo}, Ano: #{c.ano}, MotoristaID: #{c.motorista.id}"
        end
    when "CARTEIRA", "CARTEIRAS"
        carteiras = Carteira.all
        carteiras.each do |c|
            puts "..................id:#{c.id} Numero: #{c.numero}, Categoria: #{c.categoria}, Validade: #{c.validade}, MotoristaID: #{c.motorista.id}"
        end
    when "MOTORISTA", "MOTORISTAS"
        motoristas = Motorista.all
        motoristas.each do |m|
            puts "..................id:#{m.id}, Nome: #{m.nome}, Idade: #{m.idade}, Sexo: #{m.sexo}, CPF: #{m.sexo}"
        end
    when "MULTA", "MULTAS"
        multas = Multa.all
        multas.each do |m|
            puts "..................id:#{m.id} Descricao #{m.descricao}, Valor: #{m.valor}"
        end
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

prepara_ambiente

# Programa principal
puts "Quando quiser fechar o programa, digite q"
continua  = true

while continua
    puts "\nInsira o comando: (help)"
    print "> "
    comando=gets

    comando_separado = comando.split 

    case comando_separado[0].upcase
    when "HELP"
        printa_comandos
    when "Q"
        continua = false
    when "INSERE", "INSERIR", "INSIRA"
        puts "Inserindo em #{comando_separado[1]} os valores #{comando_separado[2..]}"
        if comando_separado.length >= 3
            insere_in(comando_separado[1], comando_separado[2..])
        end
    when "LISTA", "LISTAR", "LISTE"
        puts "Listando de #{comando_separado[1]}"
        if comando_separado.length >= 2
            lista_from(comando_separado[1])
        end
    when "EXCLUI", "EXCLUIR", "EXCLUE", "REMOVE"
        puts "Excluindo de #{comando_separado[1]}, #{comando_separado[2..]}"
        if comando_separado.length >= 3
            exclui_from(comando_separado[1], comando_separado[2])
        end
    else
        puts "Não sei o que fazer com #{comando}"
    end
end
