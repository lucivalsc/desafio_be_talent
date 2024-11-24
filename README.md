# Teste Técnico Mobile BeTalent

Este é um repositório com um Teste Técnico Mobile da Be.

## Desafio

O Teste Técnico Mobile BeTalent consiste em construir a visualização de uma tabela com dados que virão de uma API simulada.

### Mockup

Este é o [projeto em Figma](https://www.figma.com/design/Lpdera6rS8SztMUAwzkpN0/Teste-T%C3%A9cnico-Mobile-BeTalent?node-id=1-4&node-type=canvas&t=NI5lQZvrO1hsQCqz-0) para você se orientar. Nele, você encontrará o guia de estilos e o design da tela a ser construída.

### Requisitos Gerais

Utilizado Flutter para a construção da aplicação.

Foi usado o mínimo possível de libs externas.

A tabela deve conter as seguintes colunas:

   - imagem (thumb do/a usuário/a);
   - nome;
   - cargo
   - data de admissão;
   - telefone.

Também deve ser possível realizar pesquisa na tabela por meio de um input. O input de pesquisa deve permitir filtrar dados por cargo, nome e telefone.

Datas e telefones devem ser formatadas no front-end e não na API.

### Critérios de Avaliação

Em ordem de relevância, avaliaremos:

1. lógica de programação;
2. organização (do código e dos arquivos);
3. proficiência no uso do Flutter;
4. README, que deve conter, pelo menos, as seguintes informações: sobre o projeto, pré-requisitos e instruções para rodar a aplicação.

É um diferencial na avaliação o uso de TypeScript.

### Acesso aos dados da API simulada

Para ter acesso aos dados que alimentarão o projeto, faça o seguinte:

1. caso você não tenha, instale o pacote [json-server](https://github.com/typicode/json-server);
2. clone este repositório do GitHub em sua máquina, na pasta desafio_server tem o arquivo database.json;
3. entre na pasta do projeto, em sua máquina, e, por meio da linha de comando, execute o comando `json-server --watch <path>/database.json`, para consumir a API simulada;

É necessário deixar o json-server rodando no terminal para que os dados sejam visualizados no projeto.

Caso você tenha problemas com o json-server, tente rodá-lo com `npx json-server <path>/database.json` ou 
com `yarn json-server <path>/database.json`, em que `<path>` é o caminho completo até o diretório em que o arquivo database.json está localizado. Se mesmo assim não funcionar, busque ajuda na web.

### Link com vídeo de desenvolvimento do app e explicações
Parte 1 - https://www.youtube.com/watch?v=fpJ4kL0sMHA
Parte 2 - [https://youtu.be/Vt51bg3kL1k](https://youtu.be/Vt51bg3kL1k)

### Instruções para Rodar a Aplicação Flutter

### 1. Pré-requisitos
   - Instale o Flutter SDK.
   - Adicione o Flutter ao PATH do sistema.
   - Configure um editor de texto como o VS Code ou Android Studio.
   - Instale o JDK (Java Development Kit) para projetos que envolvam Android.
   - Configure o ambiente de desenvolvimento para iOS (em um Mac com Xcode instalado).

### 2. Clonando o Repositório
1. Obtenha o código-fonte da aplicação:
   git clone <URL_DO_REPOSITORIO>

2. Acesse a pasta do projeto:
   cd <NOME_DO_PROJETO>
   
### 3. Instalando as Dependências
   - Instale todas as dependências do projeto Flutter com o comando:
     flutter pub get

### 4. Verifique a Configuração do Ambiente
1. Confirme que o ambiente está configurado corretamente com:
   flutter doctor
   
### 5. Alterar a URL do Servidor
1. No aplicativo, localize o arquivo: lib\app\layers\presenter\providers\remote_provider.dart.
2. Na linha 10, substitua a URL existente pelo IP da máquina onde o servidor está rodando:  var url = 'http://<NOVO_IP>:3000/employees';
   - Como melhoria, poderia definir um dartDefine e passar a url base, recuperar esse valor de maneira mais global.
4. Para encontrar o IP da máquina do servidor:
   - Abra um terminal na máquina onde o servidor está em execução.
   - Digite o comando:
     ```ipconfig```
   - Localize o endereço IPv4 correspondente à sua conexão de rede.
4. Atualize o IP no código para garantir a comunicação com o servidor.

### 6. Rodando a Aplicação
1. Conecte um dispositivo físico ou inicie um emulador (Android ou iOS).
2. Execute o seguinte comando para rodar a aplicação:
   flutter run

3. Se necessário, especifique a plataforma:
   - Para Android:
     flutter run -d android
   - Para iOS:
     flutter run -d ios

### 7. Executando em um Ambiente de Produção (Opcional)
- Para gerar um build de produção:

  - Para Android:
    flutter build apk
    ou
    flutter build appbundle

  - Para iOS:
    flutter build ios

### 8. Resolvendo Problemas Comuns
- Se encontrar erros relacionados às dependências, atualize os pacotes:
  flutter pub upgrade

- Para limpar o cache do projeto, utilize:
  flutter clean
  flutter pub get

### 9. Compartilhar Logs
- Caso encontre problemas, compartilhe os logs do terminal para suporte:
  flutter logs
