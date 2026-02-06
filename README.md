![61cf10c859b367869357e88a52d0c555](https://github.com/user-attachments/assets/74e22477-1beb-45b3-bc22-1adad81a4ffb)

# WifiBadHans
alat ini fungsi untuk menyerang wifi dengan deathing tanpa khawatir kita terkena serangan diri sendiri karena di alat ini kita pakai whitelist mac wifi hp. 
aku menciptakan alat ini karena ribet harus ketik manual aircrack sama mdk4 dan juga aku pakai ini karena disekolah banyak yang pakai aku pengen main game jadi pakai alat ini 
biar orang lain gak bisa masuk ke wifi atau ditolak jadi aku bisa lancar main game xD.

intinya ini bukan Untuk handshake kalau mau handshake pakai wifite buat tahu password ( ingat ini bukan untuk wifi crack tapi
hanya untuk mematikan akses orang lain ke wifi tanpa lewat router/wifi IP login )

Hanya untuk pengunna akses root dan menggunakan uSB WIFI ADAPTER YANG BISA monitor mode dan packet injection
wajib menggunakan linux, termux root, windows dengan virtual box linux
wajib menggunakan usb wifi adapter yang bisa monitor mode dan paket injection

kalau kalian penasaran bisa dm di ig atau tiktok ya :

    tiktok : @moonshowyou
    yotube : moonshowyou
    isntagram : rehan_raditi

# Wajib install ini dulu di linux atau termux atau windows

linux

     sudo apt update && sudo apt upgrade -y
     sudo apt install aircrack-ng mdk4 git -y
     git clone https://github.com/Han20251/WifiBadHans
     cd WifiBadHans
     chmod +x Hanswifiprank.sh

atau

    sudo apt update && sudo apt upgrade -y
    sudo apt install aircrack-ng mdk4 git -y
    downlaod via zip di github 
    lalu extra file nya 
    masuk ke terminal 
    cd (lokasi file)
    chmod +x Hanswifiprank.sh

# cara aktifkan script
      
    sudo ./Hanswifiprank.sh

# termux

    untuk termux wajib hpnya di root agar bisa akses ke monitor mode wifi apdapter
    downlaod nethunter ada toturial di youtube
    lalu pakai sudo yang di atas cara linux
   
# windows

    downlaod virtual box pakai kalihunter os
    lalu pakai sudo yang di atas cara linux

# Vidio Cara Pakai Toolsnya :

IG : https://www.instagram.com/reel/DUa7Be8iWbw/?igsh=MTcxd2NuOGNkZTR6eQ==
TT : https://vt.tiktok.com/ZSaTXJaaU/

# Script ini untuk penyerangan deuthing tapi kita tidak di serang dengan memasukan mac addres hp kamu 

aku buat script ini untuk di sekolah atau publik agar kita bisa terhubung sendiri di wifi orang contoh :
saat kita di sekolah wifi nya banyak dipakai dengan script ini orang lain tidak akan bisa terhubung tapi kita bisa karena kita meng whitelist mac kita

gunakan ini hanya untuk edukasi 

     by rehan raditia pernanda
     
# !!!!!!!sama satu lagi hall penting banget!!!!!!!!!!!!

Sebelum menjalankan ini Kamu harus ubah dulu script untuk driver usb adapter wifinya 
Caranya:

# masuk ke terminal lalu ketik

    iwconfig
    cek disana driver kamu apa contoh : wlx88827910300a
    ganti ke driver kamu di file Hanswifiprank.sh menggunakan driver kamu di bagian sini
    Pakai Nano untuk ubah driver nya 
    Nano Hanswifiprank.sh

# persiapan Interface atau tempat lokasi gantinya

    RAW_IFACE="NamaDriverusbkamu"
    echo "[+] Membersihkan proses pengganggu..."
    airmon-ng check kill > /dev/null 2>&1
    rm -f /tmp/hans-scan*

kalau ada error karena saat masuk ke monitor mode otomatis jadi wlan0mon tapi untuk itu aku udah fix bug nya tapi kalau gak bisa kamu bisa edit di bagian ini:


    echo "[+] Mengaktifkan Monitor Mode pada $RAW_IFACE..."
    airmon-ng start $RAW_IFACE > /dev/null 2>&1
    MON_IFACE=$(iwconfig 2>&1 | grep "Mode:Monitor" | awk '{print $1}' | head -n 1)

    if [ -z "$MON_IFACE" ]; then
       echo -e "\e[1;31m[!] Gagal masuk ke Monitor Mode.\e[0m"
        exit 1
    fi


kalau tidak mengerti di bagian ini tanyakan ke Ai atau ke frograming yang handal..........

    Buatan rehan masih pelajar 

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
