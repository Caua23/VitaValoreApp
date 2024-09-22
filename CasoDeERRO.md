
# Erros comuns: 
## Código todo vermelho e com erros?

- Abra o arquivo [pubspec.yaml](./pubspec.yaml) e pressione `Ctrl + S` para salvá-lo. Isso irá importar todas as dependências corretamente.

## Erro de :
```
    ../../AppData/Local/Pub/Cache/hosted/pub.dev/fancy_bottom_navigation-0.3.3/lib/fancy_bottom_navigation.dart:111:7: Error: No named        
parameter with the name 'overflow'.
      overflow: Overflow.visible,
      ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/widgets/basic.dart:3876:9: Context: Found this candidate, but the arguments don't match.
  const Stack({
        ^^^^^

```
Siga as etapas abaixo para corrigir o problema:

## Passo 1: Acessar o Arquivo do Pacote

1. Navegue até o diretório onde o pacote está instalado:
C:\Users\[SeuNome]\AppData\Local\Pub\Cache\hosted\pub.dev\fancy_bottom_navigation-0.3.3\lib\

2. Pela linha 110 à 120 :
troque o comando : overflow: Overflow.visible,
por : clipBehavior: Clip.none,

3. Volte 1 pastas e Apague os arquivos 
gitignores pubspec.lock