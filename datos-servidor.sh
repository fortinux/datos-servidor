#! /bin/bash
echo "..."
echo "****** HARDWARE ******" > /tmp/datos-servidor.txt
echo "Fabricante del equipo: " >> /tmp/datos-servidor.txt
sudo dmidecode -s system-manufacturer  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Nombre del producto: " >> /tmp/datos-servidor.txt
sudo dmidecode -s system-product-name >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Versión del producto: " >> /tmp/datos-servidor.txt
sudo dmidecode -s system-version >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Número de serie del equipo: " >> /tmp/datos-servidor.txt
sudo dmidecode -s system-serial-number >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "SKU (Stock Keeping Unit) ó P/N (Part Number) del producto: " >> /tmp/datos-servidor.txt
sudo dmidecode | grep -i sku >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

# echo "Más información detallada: " >> /tmp/datos-servidor.txt
# sudo dmidecode >> /tmp/datos-servidor.txt

echo "Procesador: fabricante, modelo, y velocidad " >> /tmp/datos-servidor.txt
grep 'vendor_id' /proc/cpuinfo >> /tmp/datos-servidor.txt
grep 'model name' /proc/cpuinfo >> /tmp/datos-servidor.txt
grep 'cpu MHz' /proc/cpuinfo  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Mostrar el tipo de máquina: " >> /tmp/datos-servidor.txt
uname -m >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Virtualización (Intel-VT): " >> /tmp/datos-servidor.txt
grep -i vmx /proc/cpuinfo  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Virtualización (AMD-V): " >> /tmp/datos-servidor.txt
grep -i svm /proc/cpuinfo  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Particiones y medios de almacenamiento: " >> /tmp/datos-servidor.txt
sudo fdisk -l >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Conocer el espacio usado y disponible en las particiones: " >> /tmp/datos-servidor.txt
sudo df -h >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Memoria RAM y partición SWAP: " >> /tmp/datos-servidor.txt
free -o -m  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt


echo "****** SOFTWARE ******" >> /tmp/datos-servidor.txt
echo "Nombre y versión del kernel: " >> /tmp/datos-servidor.txt
uname -sr  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Módulos del kernel cargados al inicio: " >> /tmp/datos-servidor.txt
cat /etc/modules  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Listar todos los módulos que cargó el sistema: " >> /tmp/datos-servidor.txt
lsmod  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Distribución: " >> /tmp/datos-servidor.txt
lsb_release -idc  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Nombre del equipo: " >> /tmp/datos-servidor.txt
echo $HOSTNAME  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Resolución de Nombres de Dominio: " >> /tmp/datos-servidor.txt
sudo cat /etc/resolv.conf >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Contenido del archivo HOSTS: " >> /tmp/datos-servidor.txt
cat /etc/hosts  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Mostrar la tabla de enrutamiento: " >> /tmp/datos-servidor.txt
sudo route -n >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Direcciones IP locales de las tarjetas de red: " >> /tmp/datos-servidor.txt
sudo ifconfig >> /tmp/datos-servidor.txt
echo "Fin"
