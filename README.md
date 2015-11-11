### Para utilizar o projeto

- Baixar o projeto
- Estar com o Ruby 2.1.5 instalado (com RVM ou Rbenv ou somente ele mesmo)
- Ter a gem bundler instalada
- Executar o bundle install para instalar as gems do projeto.

O porjeto está com tudo ok, passando 100% para o simplecov e 100% para o mutant

O simplecov é executado automaticamente quando se passar o rspec no projeto.
Ex.: ~/workspace/mutant-example$ rspec spec/integration/library_spec.rb

Para ver o relatório gerado pelo simplecov, após realizar a execução do rspec, acessar o seguinte arquivo:

~/workspace/mutant-example/coverage/index.html

### Para visualizar Mutações vivas.

Deixar as seguintes linhas como comentários:

Arquivo: library_spec.rb (linhas: 29,30 e 31)

E deixar a seguinte linha descomentada:

Arquivo: library.rb (linha: 33)

# executando o rspec (Testes Unitários)
rspec spec/integration/library_spec.rb

# validando toda a classe
mutant --use rspec Library

# validando um método da classe
mutant --use rspec Library#exists_book?
