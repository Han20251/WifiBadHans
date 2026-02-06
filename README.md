# WifiBadHans

Hanya untuk pengunna akses root dan menggunakan uSB WIFI ADAPTER YANG BISA monitor mode dan packet injection

wajib menggunakan linux, termux root, windows dengan virtual box linux
wajib menggunakan usb wifi adapter yang bisa monitor mode dan paket injection

# Wajib install ini dulu di linux atau termux

linux

     sudo apt update && sudo apt upgrade
     sudo apt install aircrack-ng && sudo apt install mdk4  && sudo apt install git 
     git clone 
     cd Hanswifiprank.sh
     chmode +x Hanswifiprank.sh

# atau

    downlaod via zip di github 
    lalu extra file nya 
    masuk ke terminal 
    cd (lokasi file)
    chmode +x Hanswifiprank.sh

cara aktifkan script
      
    sudo ./Hanswifiprank.sh


termux

downlaod nethunter ada toturial di youtube
lalu pakai sudo yang di atas cara linux
   
windows

downlaod virtual box pakai kalihunter os
lalu pakai sudo yang di atas cara linux

# Script ini untuk penyerangan deuthing tapi kita tidak di serang dengan memasukan mac addres hp kamu 

aku buat script ini untuk di sekolah atau publik agar kita bisa terhubung sendiri di wifi orang contoh :
saat kita di sekolah wifi nya banyak dipakai dengan script ini orang lain tidak akan bisa terhubung tapi kita bisa karena kia meng whittlis mac kita

by rehan raditia pernanda

gunakan ini hanya untuk edukasi 

!!!!!!!!!!!!!!!!!!!!sama satu lagi hall penting banget!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Sebelum menjalankan ini Kamu harus ubah dulu script untuk driver usb adapter wifinya 
Caranya:

masuk ke terminal lalu ketik

# iwconfig
cek disana driver kamu apa contoh : wlx88827910300a
ganti ke driver kamu di file Hanswifiprank.sh menggunakan driver kamu di bagian sini

# persiapan Interface

    RAW_IFACE="NamaDriverusbkamu"
    echo "[+] Membersihkan proses pengganggu..."
    airmon-ng check kill > /dev/null 2>&1
    rm -f /tmp/hans-scan*

kalau ada error karean saat masuk ke monitor mode otomatis jadi wlan0mon tapi untuk itu aku udah fix bug nya tapi kalau gak bisa kamu bisa edit di bagian ini:


    echo "[+] Mengaktifkan Monitor Mode pada $RAW_IFACE..."
    airmon-ng start $RAW_IFACE > /dev/null 2>&1
    MON_IFACE=$(iwconfig 2>&1 | grep "Mode:Monitor" | awk '{print $1}' | head -n 1)

    if [ -z "$MON_IFACE" ]; then
       echo -e "\e[1;31m[!] Gagal masuk ke Monitor Mode.\e[0m"
        exit 1
    fi


kalau tidak mengerti di bagian ini tanyakan ke Ai atau ke frograming yang handal..........

# Buatan rehan masih pelajar 

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
