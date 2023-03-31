#!/bin/bash

# Memeriksa apakah file "list.txt" sudah ada, jika ya maka hapus file tersebut
if [ -f "list.txt" ]; then
  rm list.txt
elif [ -d "list.txt" ]; then
  rm -r list.txt
fi

# Opsi Pilihan
echo "Pilih opsi Anda:"
echo "1. Gunakan daftar domain dari file list"
echo "2. Masukkan domain satu per satu"
read -p "Opsi: " option

if [ $option -eq 1 ]; then
  # Meminta input nama file daftar domain dari pengguna
  read -p "Masukkan nama file daftar domain: " domain_list

  # Menjalankan perintah subfinder dengan file daftar domain yang diberikan dan menyimpan outputnya ke dalam file "list.txt"
  subfinder -dL "$domain_list" -o list.txt
elif [ $option -eq 2 ]; then
# Input dengan Domain tunggal
  read -p "Masukkan Domain: " input_domain

# Menjalankan perintah subfinder dengan input domain yang diberikan dan menyimpan outputnya ke dalam file "list.txt"
  subfinder -d "$input_domain" -o list.txt
else
  echo "Opsi yang dimasukkan tidak valid."
  exit 1
fi

# Menjalankan perintah subzy dengan file "list.txt" sebagai target
subzy run --targets list.txt
