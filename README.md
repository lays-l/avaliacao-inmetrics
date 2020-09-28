# Instruções e informações

Os cenários de api e de front foram separados em automation-api e automation-site

### Configurações

1. Foi utilizada a versão **2.6.5-1 do Ruby**, podendo ser encontrada aqui:
https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.5-1/rubyinstaller-devkit-2.6.5-1-x64.exe

2. O terminal utilizado é o **cmder**
https://cmder.net/

3. Ao baixar os projetos, executar o comando _bundle install_ dentro dos diretórios de cada projeto, através do terminal, para as gems necessárias serem instaladas

4. Para os testes de front, será necessário baixar a versão do **Chromedriver** compatível com o navegador utilizado na máquina, no site abaixo:
https://chromedriver.chromium.org/downloads
  Extrair o arquivo .exe baixado no diretório C:\Ruby26-x64\bin
  
### Executando os testes

Executar o comando _cucumber_ no terminal. Os testes não possuem variações de ambiente, sendo assim o default já está configurado corretamente
Para cenários específicos utilizar o _cucumber -t @<cenário>_
