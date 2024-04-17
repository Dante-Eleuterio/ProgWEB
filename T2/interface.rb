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
    when "MATERIA", "MATERIAS"
        materia = Materia.new()

        valores.each do |m|
            if m.include?("cod=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                materia.cod = value
            end
            if m.include?("nome=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                materia.nome = value
            end
        end

        materia.save

    when "ALUNO", "ALUNOS"
        aluno = Aluno.new()

        valores.each do |m|
            if m.include?("cpf=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                aluno.cpf = value
            end
            if m.include?("nome=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                aluno.nome = value
            end
        end
        aluno.save

    when "ESTADO", "ESTADOS"
        estado = Estado.new()

        valores.each do |m|
            if m.include?("sigla=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                estado.sigla = value
            end
            if m.include?("nome=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                estado.nome = value
            end
        end
        estado.save
    when "ANIMAL", "ANIMALS", "ANIMAIS"
        animal = Animal.new()

        valores.each do |m|
            if m.include?("nome=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                animal.nome = value
            end
            if m.include?("especie=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                animal.especie = value
            end
            if m.include?("id_aluno=")
                value = m.split(/=/, 2)[1] # Pega o valor depois do =
                aluno = Aluno.find_by_id(value.to_i)
                animal.aluno = aluno
            end
        end

        animal.save
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

def altera_from (tabela, valor)
    case tabela.upcase
    when "MATERIA", "MATERIAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            materia = Materia.find_by_id(value.to_i)
        end
        if valor.include?("cod=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            materia = Materia.find_by_cod(value)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            materia = Materia.find_by_nome(value)
        end
        if materia != nil
            materia.delete
        end 
    when "ALUNO", "ALUNOS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            aluno = Aluno.find_by_id(value.to_i)
        end
        if valor.include?("cod=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            aluno = Aluno.find_by_cpf(value)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            aluno = Aluno.find_by_nome(value)
        end
        aluno.delete


    when "ESTADO", "ESTADOS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            estado = Estado.find_by_id(value.to_i)
        end
        if valor.include?("cod=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            estado = Estado.find_by_sigla(value)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            estado = Estado.find_by_nome(value)
        end
        estado.delete

    when "ANIMAL", "ANIMALS", "ANIMAIS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            animal = Animal.find_by_id(value.to_i)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            animal = Animal.find_by_nome(value)
        end
        if valor.include?("especie=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            animal = Animal.find_by_especie(value)
        end
        
        animal.delete
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

def exclui_from (tabela, valor)
    case tabela.upcase
    when "MATERIA", "MATERIAS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            materia = Materia.find_by_id(value.to_i)
        end
        if valor.include?("cod=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            materia = Materia.find_by_cod(value)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            materia = Materia.find_by_nome(value)
        end
        if materia != nil
            materia.delete
        end 
    when "ALUNO", "ALUNOS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            aluno = Aluno.find_by_id(value.to_i)
        end
        if valor.include?("cod=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            aluno = Aluno.find_by_cpf(value)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            aluno = Aluno.find_by_nome(value)
        end
        aluno.delete


    when "ESTADO", "ESTADOS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            estado = Estado.find_by_id(value.to_i)
        end
        if valor.include?("cod=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            estado = Estado.find_by_sigla(value)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            estado = Estado.find_by_nome(value)
        end
        estado.delete

    when "ANIMAL", "ANIMALS", "ANIMAIS"
        if valor.include?("id=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            animal = Animal.find_by_id(value.to_i)
        end
        if valor.include?("nome=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            animal = Animal.find_by_nome(value)
        end
        if valor.include?("especie=")
            value = valor.split(/=/, 2)[1] # Pega o valor depois do =
            animal = Animal.find_by_especie(value)
        end
        
        animal.delete
    else
        puts "Não identifiquei a tabela #{tabela}"
    end
end

def  lista_from (tabela)
    case tabela.upcase
    when "MATERIA", "MATERIAS"
        materias = Materia.all
        materias.each do |m|
            puts "..................id:#{m.id} Cod: #{m.cod}, Nome: #{m.nome}"
        end
    when "ALUNO", "ALUNOS"
        alunos = Aluno.all
        alunos.each do |a|
            puts "..................id:#{a.id} Cpf: #{a.cpf}, Nome: #{a.nome}"
        end
    when "ESTADO", "ESTADOS"
        estados = Estado.all
        estados.each do |e|
            puts "..................id:#{e.id} Sigla: #{e.sigla}, Nome: #{e.nome}"
        end
    when "ANIMAL", "ANIMALS", "ANIMAIS"
        animals = Animal.all
        animals.each do |a|
            if a.aluno_id
                puts "..................id:#{a.id} Nome: #{a.nome}, Especie: #{a.especie}, Aluno: #{a.aluno_id} - #{Aluno.find_by_id(a.aluno_id).nome}"
            else
                puts "..................id:#{a.id} Nome: #{a.nome}, Especie: #{a.especie}, Aluno: Sem dono"
            end
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
