class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    def initialize titulo, preco, ano_lancamento, possui_reimpressao
        @titulo = titulo
        @preco = preco 
        @ano_lancamento = ano_lancamento
        @possui_reimpressao = possui_reimpressao
        @preco = calcula_preco(preco)
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

    def to_csv
        puts "#{@titulo}, #{@ano_lancamento}, R$ #{@preco}"
    end

    private
    def calcula_preco(base)
        # case @ano_lancamento
        #     when < 2006
        #         base * 0.9
        #     when 

        if @ano_lancamento < 2006
            if @possui_reimpressao
                base * 0.9
            else
                base * 0.95
            end
        elsif @ano_lancamento <= 2010
            base * 0.96
        else
            base
        end
    end
end

class Estoque 
    def initialize
        @livros = []
    end
    def exporta_csv
        @livros.each do |livro|
            puts livto.to_csv
            
        end
    end

    def mais_barato_que valor
        @livros.select do |livro|
            livro.preco <= valor
        end
    end
    def total
        @livros.size
    end
    def adiciona livro 
        @livros << livro if livro 
    end
end

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidacao"
        puts livro.titulo
        puts livro.preco
        puts livro.possui_reimpressao?
    end
end

algoritmos = Livro.new("Algoritmos", 100, 1998,true)
arquitetura = Livro.new("Introducao a Arquitetura e Design de Software",70, 2011, true)

estoque = Estoque.new
estoque.adiciona algoritmos 
estoque.adiciona arquitetura
estoque.adiciona Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque.adiciona Livro.new("Programinh Ruby", 100, 2004, true)
estoque.adiciona nil


baratos = estoque.mais_barato_que 80

baratos.each do |livro|
    puts livro.titulo
end

puts 'todos livros'
puts "------------"
estoque.exporta_csv
