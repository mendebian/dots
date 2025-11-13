#!/bin/bash

# Obter informações da janela ativa
window_info=$(hyprctl activewindow -j 2>/dev/null)

if [[ -z "$window_info" ]]; then
    echo ""
    exit 0
fi

# Extrair a classe do aplicativo
app_class=$(echo "$window_info" | jq -r '.class')

if [[ -z "$app_class" || "$app_class" == "null" ]]; then
    echo ""
    exit 0
fi

# Formatação simples: remove hífens e capitaliza
formatted=$(echo "$app_class" | sed 's/-/ /g')
echo "$formatted" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1'