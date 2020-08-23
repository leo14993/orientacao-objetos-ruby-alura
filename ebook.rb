class EBook
    attr_reader :titulo, :preco, :ano_lancamento, :editora
    def initialize (titulo, preco, ano_lancamento,editora)
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @preco = calcula_preco(preco)
        @editora = editora
    end

    def matches?(query)
        # query=="ebook" || query=="digital"
        ["ebook","digital"].include?(query)
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

