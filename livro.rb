class Livro
    attr_reader :titulo, :preco, :ano_lancamento, :editora, :tipo
    def initialize (titulo, preco, ano_lancamento, possui_reimpressao\
        ,editora, tipo)
        @titulo = titulo
        @preco = preco 
        @ano_lancamento = ano_lancamento
        @possui_reimpressao = possui_reimpressao
        @preco = calcula_preco(preco)
        @editora = editora
        @tipo = tipo
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

