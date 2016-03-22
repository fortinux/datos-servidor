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

echo "Procesador: fabricante, modelo y velocidad " >> /tmp/datos-servidor.txt
grep 'model name' /proc/cpuinfo >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt
lscpu >> /tmp/datos-servidor.txt
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
cat /proc/version >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Módulos del kernel cargados al inicio: " >> /tmp/datos-servidor.txt
cat /etc/modules  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Listar todos los módulos que cargó el sistema: " >> /tmp/datos-servidor.txt
lsmod  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Sistema operativo: " >> /tmp/datos-servidor.txt
cat /etc/os-release  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Distribución: " >> /tmp/datos-servidor.txt
lsb_release -idc  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Nombre del equipo: " >> /tmp/datos-servidor.txt
echo $HOSTNAME  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "Tiempo total encendido: " >> /tmp/datos-servidor.txt
uptime  >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt

echo "****** RED ******" >> /tmp/datos-servidor.txt

echo "Resolución de Nombres de Dominio (DNS): " >> /tmp/datos-servidor.txt
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

echo "****** HTTP HEAD ******" >> /tmp/datos-servidor.txt

echo "Resultado: " >> /tmp/datos-servidor.txt
echo -n "Escriba la dirección web de la aplicación (por ej. http://wwww.miweb.com): "
read direccionweb
sudo curl -X HEAD -i $direccionweb >> /tmp/datos-servidor.txt
echo " " >> /tmp/datos-servidor.txt
echo "****** .-. ******" >> /tmp/datos-servidor.txt
echo "FIN"
