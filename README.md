# Curso Full Cycle

## Módulo Docker

Aqui estão os fontes para os exercícios do primeiro módulo do curso Full Cycle - Daniel Lourenço Curado

Em cada sessão deixarei um pouco da experiência que tive e assim podendo coletar feedbacks de como poderia fazer diferente

### 1º Exercício

*Imagem:* dlcurado/fullcycle

Para subir um container com Golang e criar o projeto, foi interesante.
Primeiramente pensei em subir na minha máquina local, criar, compilar e fazer deploy em uma imagem enxuta, só para execução.

Mas lembrando do exemplo do *Nodejs sem Node*, achei melhor criar um Dockerfile onde eu baixasse uma imagem já com Golang, criasse os arquivos dentro desse container, buildasse e executasse.

Fui por duas abordagens aqui e gostaria de um feedback:
1. Rodar uma imagem golang com volume compartilhado. Editar os arquivos na minha máquina (HOST) que seria atualizados dentro do container e depois seguiria com o build e deploy (shrink).
Mas isso não deu certo! Tive problemas de permissão para criar ou editar os arquivos. Então parti para a solução 2

1. Rodar uma imagem golang, instalar o *vim*, criado o .mod e criar + editar o .go dentro do container.
Foi meio estranho, mas por ser pequeno, funcionou

Com os arquivos do projeto pronto, resolvi criar um Dockerfile que compilasse o app em uma primeira imagem.
Depois crei uma outra imagem partindo do scratch, copiando o executável e rodando o aplicativo.

Esta é a versão atual da solução.

Obrigado
