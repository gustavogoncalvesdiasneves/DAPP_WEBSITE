#!/bin/bash

# Caminho para o diretório ou arquivo que você deseja adicionar ao IPFS
FILE_PATH="."

# Adiciona o arquivo ou diretório ao IPFS e captura o novo hash
NEW_HASH=$(ipfs add -r $FILE_PATH | tail -n 1 | awk '{print $2}')

# Exibe o novo hash
echo "Novo hash (CID): $NEW_HASH"

# Opcional: Atualize o link do gateway IPFS
echo "Acesse seu arquivo atualizado em: https://cloudflare-ipfs.com/ipfs/$NEW_HASH"
