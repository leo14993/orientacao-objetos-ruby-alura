require_relative "contador"

class Estoque
    attr_reader :livros 
    def initialize
        @livros = []
        @vendas = []
        @livros.extend Contador
    end

    # Toda vez que implementa o metodo de missing para mudar o comportamento de metodos
    # que a gente reponde, precisamos sobrescrever também o metodo respond_to?

    def method_missing(name)
        matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
        if matcher
            tipo = matcher[1]
            #transformando  o campo em um simbolo
            campo = matcher[2].to_sym
            que_mais_vendeu_por(tipo, &campo)
        else
            super
        end 
    end

    def respond_to?(name)
        #verifica se a chaamda de metodo é equivalente ao metodo que a gente espera,
        # ou se a nossa classe pai responde por esse metodo, então devolve algo que tem valro verdadeiro

        name.to_s.match("(.+)_que_mais_vendeu_por_(.+)") || super
    
    end

    def exporta_csv
        @livros.each do |livro|
            puts livro.to_csv
            
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
    def <<(livro )
        @livros << livro if livro
        self
    end
    def vende(livro)
        @livros.delete livro
        @vendas << livro
    end
    def maximo_necessario
        @livros.maximo_necessario
    end

    #metodos nao chamados de fora da classe são inseridos no escopo privado
    # para não serem invocados por fora da classe
    private

    def quantidade_de_vendas_por(produto, &campo)
        @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
    end

    def que_mais_vendeu_por(tipo, &campo)
        @vendas.select{|l| l.tipo == tipo}.sort {|v1, v2|
            quantidade_de_vendas_por(v1, &campo) <=> 
        quantidade_de_vendas_por(v2, &campo)}.last
    end
end
