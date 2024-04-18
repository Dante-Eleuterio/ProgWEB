#Dante Eleutério dos Santos GRR20206686
$:.push './'
require 'inicia.rb'

def printa_comandos
    puts "Lista de comandos:
    help    -> Lista comandos
    tabelas -> Lista tabelas
    q       -> Termina o programa
-- operaçõs de tabela ----------------
 < operação > < tabela > { atributo=valor }
    insere 
    lista
    exclui
    altera" 
end

def insere_in (tabela, valores)
    case tabela.upcase
    when "CARRO", "CARROS"
        carro = Carro.new()

        valores.each do |c|
            if c.include?("placa=")
                value = c.split(/=/, 2)[1] 
                carro.placa = value
            end
            if c.include?("modelo=")
                value = c.split(/=/, 2)[1] 
                carro.modelo = value
            end
            if c.include?("ano=")
                value = c.split(/=/, 2)[1] 
                carro.ano = value
            end
            if c.include?("motoristaID=")
            value = c.split(/=/, 2)[1]
            mot = Motorista.find_by_id(value)
            carro.motorista=mot
    	    end
        end

        carro.save

    when "CARTEIRA", "CARTEIRAS"
        carteira = Carteira.new()

        valores.each do |c|
            if c.include?("numero=")
                value = c.split(/=/, 2)[1] 
                carteira.numero = value
            end
            if c.include?("categoria=")
                value = c.split(/=/, 2)[1] 
                carteira.categoria = value
            end
            if c.include?("validade=")
                value = c.split(/=/, 2)[1] 
                carteira.validade = value
            end
            if c.include?("motoristaID=")
                value = c.split(/=/, 2)[1]
                mot = Motorista.find_by_id(value)
                carteira.motorista=mot
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
        multa = Multa.new()

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
    when "MULTACARRO"
        valores.each do |m|
            if m.include?("carroID=")
                value = m.split(/=/, 2)[1] 
                puts value
                puts "canela"
                carro = Carro.find_by_id(value)
            end
            if m.include?("multaID=")
                value = m.split(/=/, 2)[1] 
                puts value
                puts "batata"
                multa = Multa.find_by_id(value)
            end
        end
        if carro != nil && multa !=nil
            carro.multas << multa
        else
            puts "Falha em pelo menos um dos dois IDs"
        end

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
            if carro != nil
                carro.delete
            end
        end
        if valor.include?("placa=")
            value = valor.split(/=/, 2)[1] 
            carro = Carro.where(placa: value)
	        if carro != nil
                carro.each do |c|
                	c.delete
           	    end 
	        end
        end
        if valor.include?("modelo=")
            value = valor.split(/=/, 2)[1] 
            carro = Carro.where(modelo: value)
	        if carro != nil
                carro.each do |c|
                	c.delete
                end
            end 
        end
        if valor.include?("ano=")
            value = valor.split(/=/, 2)[1] 
            carro = Carro.where(ano: value)
	        if carro != nil
                carro.each do |c|
                	c.delete
                end
           	end 
        end 
    when "CARTEIRA", "CARTEIRAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.find_by_id(value.to_i)
            if carteira != nil
                carteira.delete
            end
        end
        if valor.include?("numero=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.find_by_numero(value)
            if carteira != nil
                carteira.delete
            end
        end
        if valor.include?("categoria=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.where(categoria: value)
            if carteira != nil
                carteira.each do |c|
                    carteira.delete
                end
            end
        end
        if valor.include?("validade=")
            value = valor.split(/=/, 2)[1] 
            carteira = Carteira.where(validade: value)
            if carteira != nil
                carteira.each do |c|
                    carteira.delete
                end
            end
        end
       
    when "MOTORISTA", "MOTORISTAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_id(value.to_i)
            car = Carro.all
       	    carteiras = Carteira.all
            if motorista != nil
                motorista.carros.each(&:destroy)
                motorista.carteira.destroy if motorista.carteira
                motorista.delete    
            end
	    end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_nome(value)
            car = Carro.all
            if motorista != nil
                motorista.carros.each(&:destroy)
                motorista.carteira.destroy if motorista.carteira
                motorista.delete    
            end
        end
        if valor.include?("idade=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_idade(value)
            car = Carro.all
            if motorista != nil
                motorista.carros.each(&:destroy)
                motorista.carteira.destroy if motorista.carteira
                motorista.delete    
            end
        end
        if valor.include?("sexo=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_sexo(value)
            car = Carro.all
            if motorista != nil
                motorista.carros.each(&:destroy)
                motorista.carteira.destroy if motorista.carteira
                motorista.delete    
            end
        end
        if valor.include?("cpf=")
            value = valor.split(/=/, 2)[1] 
            motorista = Motorista.find_by_cpf(value)
            car = Carro.all
            if motorista != nil
                motorista.carros.each(&:destroy)
                motorista.carteira.destroy if motorista.carteira
                motorista.delete    
            end
        end
        

    when "MULTA", "MULTAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] 
            multa = Multa.find_by_id(value.to_i)
            if multa != nil
                multa.delete
            end
        end
        if valor.include?("descricao=")
            value = valor.split(/=/, 2)[1] 
            multa = Multa.find_by_descricao(value)
            if multa != nil
                multa.delete
            end
        end
        if valor.include?("valor=")
            value = valor.split(/=/, 2)[1] 
            multa = Multa.find_by_valor(value)
            if multa != nil
                multa.delete
            end
        end
        
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

def altera_from (tabela, valores)
    case tabela.upcase
    when "CARRO", "CARROS"
        carro = Carro
        valores.each do |c|
            if c.include?("id=")
                value = c.split(/=/, 2)[1] 
                carro = Carro.find_by_id(value)
            end
        end
        valores.each do |c|
            if c.include?("placa=")
                value = c.split(/=/, 2)[1] 
                carro.placa = value
            end
            if c.include?("modelo=")
                value = c.split(/=/, 2)[1] 
                carro.modelo = value
            end
            if c.include?("ano=")
                value = c.split(/=/, 2)[1] 
                carro.ano = value
            end
            if c.include?("motoristaID=")
            value = c.split(/=/, 2)[1]
            mot = Motorista.find_by_id(value)
            carro.motorista=mot
    	    end
        end

        carro.save

    when "CARTEIRA", "CARTEIRAS"
        carteira = Carteira
        valores.each do |c|
            if c.include?("id=")
                value = c.split(/=/, 2)[1] 
                carteira = carteira.find_by_id(value)
            end
        end
        valores.each do |c|
            if c.include?("numero=")
                value = c.split(/=/, 2)[1] 
                carteira.numero = value
            end
            if c.include?("categoria=")
                value = c.split(/=/, 2)[1] 
                carteira.categoria = value
            end
            if c.include?("validade=")
                value = c.split(/=/, 2)[1] 
                carteira.validade = value
            end
            if c.include?("motoristaID=")
                value = c.split(/=/, 2)[1]
                mot = Motorista.find_by_id(value)
                carteira.motorista=mot
            end
        end
        carteira.save

    when "MOTORISTA", "MOTORISTAS"
        motorista = Motorista
        valores.each do |m|
            if m.include?("id=")
                value = m.split(/=/, 2)[1] 
                motorista = Motorista.find_by_id(value)
            end
        end
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
        multa = Multa
        valores.each do |m|
            if m.include?("id=")
                value = m.split(/=/, 2)[1] 
                multa = Multa.find_by_id(value)
            end
        end

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
def  lista_from (tabela)
    case tabela.upcase
    when "CARRO", "CARROS"
        carros = Carro.all
        carros.each do |c|
            puts "id: #{c.id}, Placa: #{c.placa}, Modelo: #{c.modelo}, Ano: #{c.ano}, MotoristaID: #{c.motorista.id}"
        end
    when "CARTEIRA", "CARTEIRAS"
        carteiras = Carteira.all
        carteiras.each do |c|
            puts "id:#{c.id}, Numero: #{c.numero}, Categoria: #{c.categoria}, Validade: #{c.validade}, MotoristaID: #{c.motorista.id} "
        end
    when "MOTORISTA", "MOTORISTAS"
        motoristas = Motorista.all
        motoristas.each do |m|
            puts "id:#{m.id}, Nome: #{m.nome}, Idade: #{m.idade}, Sexo: #{m.sexo}, CPF: #{m.cpf}"
        end
    when "MULTA", "MULTAS"
        multas = Multa.all
        multas.each do |m|
            puts "id:#{m.id}, Descricao: #{m.descricao}, Valor: #{m.valor}"
        end
    when "MULTACARRO"
        carros = Carro.all
        multas = Multa.all
        carros.each do |c|
            c.multas.each do |m|
                puts "carroID:#{c.id}, Placa: #{c.placa}, MultaID: #{m.id}"
            end
        end
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

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
    when "TABELAS"
        puts "Listando Tabelas"
        puts "Carro\nCarteira\nMotorista\nMulta\nMultacarro"
    when "INSERE"
        if comando_separado.length >= 3
            puts "Inserindo em #{comando_separado[1]} os valores #{comando_separado[2..]}"
            insere_in(comando_separado[1], comando_separado[2..])
        else
            puts "Faltam argumentos"
        end
    when "LISTA"
        if comando_separado.length >= 2
            puts "Listando de #{comando_separado[1]}"
            lista_from(comando_separado[1])
        else
            puts "Faltam argumentos"
        end
    when "EXCLUI"
        if comando_separado.length >= 3
            puts "Excluindo de #{comando_separado[1]}, #{comando_separado[2]}"
            exclui_from(comando_separado[1], comando_separado[2])
        else
            puts "Faltam argumentos"
	    end    
    when "ALTERA"
        if comando_separado.length >= 4
            puts "Alterando de #{comando_separado[1]}, #{comando_separado[2..]}"
            altera_from(comando_separado[1], comando_separado[2..])
        else
            puts "Faltam argumentos"
	    end
    else
        puts "Não sei o que fazer com #{comando}"
    end
end
