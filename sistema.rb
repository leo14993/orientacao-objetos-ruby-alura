require_relative "livro"
require_relative "estoque"

class Array
    attr_reader :maximo_necessario

    def <<(livro)
        push(livro)
        if @maximo_necessario.nil? || @maximo_necessario < size
            @maximo_necessario = size
        end
        self
    end
end

# def livros_computacao.length
#     unique = []
#     self.each do |item|
#       unique.push(item) unless unique.include?(item)
#     end
#     unique.length

# end

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidacao"
        puts livro.titulo
        puts livro.preco
        puts livro.possui_reimpressao?
    end
end

algoritmos = Livro.new("Algoritmos", 100, 1998,true, "")
arquitetura = Livro.new("Introducao a Arquitetura e Design de Software",
    70, 2011, true, "")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "")
ruby = Livro.new("Programinh Ruby", 100, 2004, true, "")

estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby

estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende ruby
estoque.vende ruby





# baratos.each do |livro|
#     puts livro.titulo
# end

# puts 'todos livros'
# puts "------------"
# estoque.exporta_csv


# class Conversor
#     def string_para_alfanumerico(nome)
#         nome.gsub /[^\w\s]/,''
#     end
# end

# class Float
#     def para_dinheiro
#       valor = "R$" << self.to_s.tr('.', ',')
#       valor << "0" unless valor.match /(.*)(\d{2})$/
#       valor
#     end
# end

# puts precos = [30.00, 40.00, 70.00, 59.00]
# precos_string = []
# precos.each do |preco|
# puts preco.class
# precos_string << preco.para_dinheiro
# end
# puts precos_string.to_s