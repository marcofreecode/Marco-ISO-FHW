#!/bin/bash
# Inventario de hardware para la Tarea 2 (Naix un sistema)
# Uso: bash inventario.sh

sudo apt install -y smartmontools ethtool pciutils lshw >/dev/null 2>&1
F=~/inventario_$(hostname)_$(date +%F).txt
{
echo "===== EQUIPO: $(hostname) · $(date) ====="
echo; echo "===== PLACA BASE Y FIRMWARE ====="
sudo dmidecode -s system-manufacturer; sudo dmidecode -s system-product-name
sudo dmidecode -s baseboard-product-name; sudo dmidecode -s bios-version
[ -d /sys/firmware/efi ] && echo "Arranque: UEFI" || echo "Arranque: BIOS (Legacy)"
mokutil --sb-state 2>/dev/null
ls /dev/tpm* >/dev/null 2>&1 && echo "TPM: presente" || echo "TPM: no detectado"
echo; echo "===== CPU ====="
LC_ALL=C lscpu | grep -E "Model name|^CPU\(s\)|Core\(s\) per socket|Thread\(s\) per core|Socket|max MHz|Virtualization|L3"
echo; echo "===== RAM ====="
free -h
sudo dmidecode -t memory | grep -E "Maximum Capacity|Number Of Devices|^\s+Size:|^\s+Type:|^\s+Speed:|Form Factor|Locator:" | grep -v "Bank"
echo; echo "===== DISCOS (ROTA 0 = SSD, 1 = HDD) ====="
lsblk -d -o NAME,SIZE,ROTA,TRAN,MODEL
echo; df -h --total | grep -E "Filesystem|^/dev|total"
for d in $(lsblk -dno NAME | grep -E "^(sd|nvme)"); do echo; echo "--- SMART /dev/$d ---"; sudo smartctl -H -i /dev/$d | grep -E "Model|Capacity|overall-health|SMART"; done
echo; echo "===== RED ====="
ip -br a
for i in $(ls /sys/class/net | grep -v lo); do echo "--- $i ---"; sudo ethtool $i 2>/dev/null | grep -E "Speed|Duplex|Link detected"; done
lspci | grep -iE "ethernet|network|wireless"
echo; echo "===== GRÁFICA ====="
lspci | grep -iE "vga|3d|display"
echo; echo "===== PERIFÉRICOS USB ====="
lsusb
echo; echo "===== SISTEMA OPERATIVO ====="
grep PRETTY_NAME /etc/os-release; uname -r
echo; echo "===== BATERÍA / ALIMENTACIÓN ====="
upower -i $(upower -e | grep -i bat) 2>/dev/null | grep -E "model|energy-full|capacity|state" || echo "Sin batería (sobremesa)"
} 2>/dev/null | tee "$F"
echo; echo ">>> Guardado en $F"
