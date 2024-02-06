#!/bin/bash

# Defina o diretório de origem que você quer fazer o backup
BACKUP_SOURCE="/PATH/TO/BACKUP/FOLDER/"

# Defina o nome do arquivo de backup com data e hora
DATE=$(date +"%y-%m-%d")
TIMESTAMP=$(date +"%H%M%S")
ARCHIVE_NAME="backup_${DATE}_${TIMESTAMP}.tar.gz"

# Comprime o diretório de origem em um arquivo tar.gz
tar -czvf ${ARCHIVE_NAME} ${BACKUP_SOURCE}

# Use o rclone para fazer o upload do arquivo de backup para o Google Drive
rclone copy ${ARCHIVE_NAME} gdrive:/PATH/TO/YOUR/DRIVE/FOLDER

# Remova o arquivo de backup local após o upload bem-sucedido
rm ${ARCHIVE_NAME}

