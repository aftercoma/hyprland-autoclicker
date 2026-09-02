#!/usr/bin/env bash


Autoclicker__init() {
    this_delay_ms=300
    this_delay_sec=0
    this_unit_choice=2
    this_time_val=17
    this_interval_sec=1020
}

Autoclicker__show_banner() {
    echo "=============================================="
    echo "    Hyprland Autoclicker (wlrctl) By Brody.   "
    echo "=============================================="
}

Autoclicker__get_inputs() {
    read -p "Jeda antar klik (milidetik) [Default: 300]: " input_delay
    this_delay_ms=${input_delay:-300}
    this_delay_sec=$(awk "BEGIN {print $this_delay_ms/1000}")

    echo ""
    echo "Pilih satuan interval perulangan:"
    echo "1) Detik"
    echo "2) Menit"
    echo "3) Jam"
    read -p "Pilihan (1/2/3) [Default: 2]: " input_unit
    this_unit_choice=${input_unit:-2}

    read -p "Masukkan durasi interval [Default: 17]: " input_time
    this_time_val=${input_time:-17}

    Autoclicker__calculate_interval
}

Autoclicker__calculate_interval() {
    case $this_unit_choice in
        1) this_interval_sec=$this_time_val ;;
        2) this_interval_sec=$((this_time_val * 60)) ;;
        3) this_interval_sec=$((this_time_val * 3600)) ;;
        *) this_interval_sec=$((this_time_val * 60)) ;;
    esac
}

Autoclicker__show_config() {
    echo ""
    echo "----------------------------------------"
    echo "Konfigurasi Aktif:"
    echo "- Delay 2x klik : ${this_delay_ms} ms"
    echo "- Interval loop : ${this_time_val} (Total: ${this_interval_sec} detik)"
    echo "----------------------------------------"
    echo "Arahkan kursor ke tombol game, script akan mulai dalam 3 detik..."
    echo "Tekan Ctrl+C di terminal ini untuk berhenti."
    sleep 3
}

Autoclicker__run() {
    while true; do
        wlrctl pointer click left
        echo "[$(date +'%H:%M:%S')] Klik 1 terkirim"
        sleep $this_delay_sec

        wlrctl pointer click left
        echo "[$(date +'%H:%M:%S')] Klik 2 terkirim"
        echo "[$(date +'%H:%M:%S')] Menunggu ${this_time_val} satuan waktu untuk siklus berikutnya..."
        sleep $this_interval_sec
    done
}

main() {
    Autoclicker__init
    Autoclicker__show_banner
    Autoclicker__get_inputs
    Autoclicker__show_config
    Autoclicker__run
}
main
