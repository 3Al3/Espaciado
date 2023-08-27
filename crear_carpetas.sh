#!/bin/bash

function create_month_and_days_folders() {
    local year=$1
    local month=$2
    local days_in_month=$(date -d "${year}-${month}-01 +1 month -1 day" +"%d")

    # Crear carpeta del mes
    mkdir -p "${year}-${month}"

    # Crear subcarpetas para los dias
    for ((day=1; day<=days_in_month; day++)); do
        day_padded=$(printf "%02d" $day)
        mkdir -p "${year}-${month}/${day_padded}"
    done
}

function create_today_folder() {
    local year=$1
    local month=$2
    local today=$(date +"%d")

    for ((day=1; day<=today; day++)); do
        day_padded=$(printf "%02d" $day)
    done
}

current_year=$(date +"%Y")
current_month=$(date +"%m")

# Crear carpetas para cada mes y subcarpetas para los dias
for ((month=1; month<=12; month++)); do
    # Formatear el mes para que tenga dos dÃ­gitos (01, 02, ..., 12)
    month_padded=$(printf "%02d" $month)
    create_month_and_days_folders $current_year $month_padded
    if [ "$current_year-$month_padded" == "$current_year-$current_month" ]; then
        create_today_folder $current_year $month_padded
    fi
done

mkdir hoy

echo "Carpetas creadas exitosamente"
