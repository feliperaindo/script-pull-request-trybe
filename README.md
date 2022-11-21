# scritp-pull-request-trybe
PT-BR:
script em shell, destinado a automatizar comandos git para projetos da trybe.

Faça um clone do conteúdo desse repositório e siga os próximos passos.

<hr>

EN-US:
shell script, intended to automate git commands for trybe projects.

Clone this repository content and follow next steps.
<hr>

<br>

## PT-BR:
### !! SIGA AS INSTRUÇÕES ABAIXO !! OS PASSOS DESCRITOS ABAIXO SÃO OBRIGATÓRIOS !!

> **MUITO IMPORTANTE**: Para usar esse script é necessário a instalação do pacote `github cli` para que o usuário possa usar comandos `gh`, necessário também que o usuário tenha um token pessoal do github.

+ --> Para instalação do `github cli`, no linux, acesse a página oficial com esse [link](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) e siga o tutorial de instação antes de continuar.

+ --> Para instalação do `github cli`, em outras plataformas, acesse a página oficial com esse [link](https://github.com/cli/cli) e siga o tutorial de instalação antes de continuar.

+ --> Para criar um token pessoal do github, acesse pelo navegador sua página pessoal do github e siga a seguinte sequência de links no menu principal: `settings` -> `developer settings` -> `personal access tokens` e `create a token`.

> Após a instalação do "github cli" e da criação do token pessoal do github abra o arquivo "script-to-pr.sh" em um editor de texto (VSCode, gedit, vim, nano, etc.).

+ **Passo 1** --> Nas primeiras linhas do arquivo `script-to-pr.sh` encontre o texto `TOKEN="personal token from github"` e substitua o texto "personal token from github" pelo seu token pessoal do github. NÃO REMOVA AS ASPAS DUPLAS, APENAS SUBSTITUA O TEXTO.

+ **Passo 2** --> Nas primeiras linhas do arquivo `script-to-pr.sh` encontre o texto `LOCAL_DIR="local directory you will choose"` e modifique 'local directory you will choose' pelo caminho completo do diretório a sua escolha. Esse diretório será usado para armazenar todos os repositórios que você clonar usando esse scritp. NÃO REMOVA AS ASPAS DUPLAS, APENAS SUBSTITUA O TEXTO.

+ **Passo 3** --> Nas primeiras linhas do arquivo `script-to-pr.sh` encontre o texto `TEAM="inform your team"` e modifique 'inform your team' pela letra MINÚSCULA da sua turma. NÃO REMOVA AS ASPAS DUPLAS, APENAS SUBSTITUA O TEXTO.

+ **Passo 4** --> Para poder executar esse script no terminal é necessário executar manualmente o comando a seguir no terminal: `chmod u+x 'local saved'/'file-name'`.
>A referência `local saved` é o caminho completo do diretório em que esse script esta salvo.
><br>
>A referência `file-name` é o nome do desse arquivo (por padrão o nome desse aquivo é `script-to-pr.sh`). Se o nome foi alterado, use o nome atual do arquivo/script.

**ATENÇÃO!!**: Esse scritp recebe 3 (três) parâmetros por padrão, o 1º (primeiro) parâmetro é a URL da página principal do repositório github. O 2º (segundo) e 3º (terceiro) parâmetros são respectivamente o primeiro e último nome do usuário. Se for trocada a ordem dos parâmetros no momento da execução esse script não funcionará adequadamente.

**RECOMENDADO**: Antes de usar esse script pela primeira vez, leia o código para entender o que cada linha de código faz, e se necessário faça as alterações que achar pertinente.

<br>

### COMO UTILIZAR:
Após completar os passos obrigatórios anteriores, para utilizar o script, escolha um reposotório no github e copie a URL.

<br>
<br>

Abra o seu terminal e digite o seguinte comando `"path/script-to-pr.sh https://github.com/... fistName lastName"` e o script se encarregará de fazer todo o trabalho.

>*Exemplo*: caso eu queira fazer o clone desse repositório e abrir um Pull Request eu rodaria o seguinte comando no terminal da minha máquina `~/script-to-pr.sh https://github.com/feliperaindo/scritp-pull-request-trybe felipe carvalho`.
>
>Note que o `path/` é representado pelo `~/` o que representa a minha pasta `home/` na raiz do meu sistema.
>
>O `script-to-pr.sh` é a chamada do meu script.
>
>O `https://github.com/feliperaindo/scritp-pull-request-trybe` é a identificação do repositório github que quero clonar.
>
>E por fim, a parte final, que inclui os dois argumentos `felipe` e `carvalho` são respectivamente os parâmetros `firstName` e `lastName` descritos no código do script.

<hr>

<br>
<br>

## EN-US:
### !! FOLLOW INSTRUCTIONS BELOW !! STEPS BELOW ARE REQUIRED !!

> **VERY IMPORTANT**: To use this script you have to install `github cli` to use `gh` commands, and have a github personal token.

+ --> To install `github cli`, on linux, access official webpage with this [link](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) and follow tutorial installation before continuing.

+ --> To install `github cli`, on another platform, access official webpage with this [link](https://github.com/cli/cli) and follow tutorial installation before continuing.

+  --> To create a github personal token access your github account webpage and folow this menu links:  `settings` -> `developer settings` -> `personal access tokens` and `create a token`.

+ Step 1 --> In the first lines from file `script-to-pr.sh` foud the text `TOKEN="personal token from github"` and substitute "personal token from github" for your personal github token. DO NOT REMOVE QUOTATION MARKS, JUST SUBSTITUTE THE TEXT INSIDE.

+ Step 2 --> In the first lines from file `script-to-pr.sh` foud the text `LOCAL_DIR="local directory you will choose"` and substitute 'local directory you will choose' for a entire path directory you choose. This directory will be use to storage all repositories you will clone using this scritp. DO NOT REMOVE QUOTATION MARKS, JUST SUBSTITUTE THE TEXT INSIDE.

+ Step 3 --> In the first lines from file `script-to-pr.sh` foud the text `TEAM="inform your team"` and substitute 'inform your team' for the letter in LOWER CASE of your team. DO NOT REMOVE QUOTATION MARKS, JUST SUBSTITUTE THE TEXT INSIDE.

+ Step 4 --> To execute this file as a script in your terminal, you need to run manually in terminal the command `chmod u+x 'local saved'/'file-name'`.
>The reference `local saved` is the entire path of directory you saved this file.
><br>
>The reference `file-name` is the name you have for this file (as default it name is `script-to-pr`). If you change it's name or download it with another name, use file actual name.

**ATTENTION**: This script receive 3 (three) parameters as default, the 1º(first) parameter is a github main repository webpage URL. The 2º(second) and 3º(third) parameters are yours firstname and lastname, in this order. If you change parameters orders when execute this script it won't work property.

**RECOMENDED**: Before use this script at the first time, read entire code to understand what even part of this code do, and make some changes if you need or want.

<br>

### HOW TO USE:
  After complete all required steps describe before, to use this script, choose a github repository em copy the URL.

<br>
<br>

Open terminal and type the follow command `"path/script-to-pr.sh https://github.com/... fistName lastName"` and the script will be sure to do all of work.

>*Example*: if I want to clone this repository and open a Pull Request I run the follow command in my computer terminal `~/script-to-pr.sh https://github.com/feliperaindo/scritp-pull-request-trybe felipe carvalho`.
>
>Note that the `path/` is represented by `~/` that represents my directory `home/` on system root.
>
>The `script-to-pr.sh` is called by this part of command.
>
>The `https://github.com/feliperaindo/scritp-pull-request-trybe` is the github repository identification who I want to clone.
>
>At a final two arguments `felipe` e `carvalho` they are the parameters `firstName` and `lastName` described in script code.
