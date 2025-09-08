#!/usr/bin/env bash

# Diretório de origem
SRC_DIR="/home/.gentoo-files/etc"

# Diretório de destino para os tar.gz
DEST_DIR="/home/.gentoo-files/backups"

# Cria o diretório de backups se não existir
mkdir -p "$DEST_DIR"

# Nome do arquivo com data (formato YYYYMMDD_HHMMSS)
BACKUP_NAME="etc_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Cria o tar.gz
sudo tar -czf "$DEST_DIR/$BACKUP_NAME" -C "$SRC_DIR" .

echo "Backup criado: $DEST_DIR/$BACKUP_NAME"

# Mantém apenas os 3 arquivos mais recentes, remove o restante
ls -1t "$DEST_DIR"/etc_backup_*.tar.gz | tail -n +9 | xargs -r rm --

echo "Arquivos antigos removidos, mantendo apenas os 3 últimos backups."
notify-send "COMPACTANDO ETC FILES:" "Arquivos antigos removidos, mantendo apenas os 3 últimos backups."


