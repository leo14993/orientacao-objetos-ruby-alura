class Livro
    attr_reader :titulo,:preco ,:ano_lancamento
    
    def initialize (titulo, preco, ano_lancamento)
        @titulo = titulo
        @preco = preco 
        @ano_lancamento = ano_lancamento
    
    end
end

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        p "Newsletter/Liquidacao"
        p livro.titulo
        p livro.preco
    end

end

def aplica_promocoes(livro)
    if livro.ano_lancamento < 2000
        livro.preco *= 0.7
    end
end


algoritmos = Livro.new("Algoritmos", 100, 1998)

livro_para_newsletter(algoritmos)
aplica_promocoes(algoritmos)