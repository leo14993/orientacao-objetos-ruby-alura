class Livro
    attr_reader :titulo, :ano_lancamento
    attr_accessor :preco
    def initialize (titulo, preco, ano_lancamento)
        @titulo = titulo
        @preco = preco 
        @ano_lancamento = ano_lancamento
        if ano_lancamento < 2000
            @preco *= 0.7
        end
    
    end
end

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        p "Newsletter/Liquidacao"
        p livro.titulo
        p livro.preco
    end

end

algoritmos = Livro.new("Algoritmos", 100, 1998)

livro_para_newsletter(algoritmos)
aplica_promocoes(algoritmos)