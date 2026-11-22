# Problemas

| Problema | Solucion |
|---|---|
| SrvCom se quedaba sin red (Tx Unit Hang de la tarjeta e1000) | Reiniciar y cambiar la tarjeta a virtio-net |
| sudo no funcionaba en SrvCom y LinuxCliente | Meter el usuario en el grupo sudo y volver a entrar |
| TrueNAS no aceptaba la puerta de enlace | Poner la IP sin /24 |
| OPNsense volvia a arrancar desde la ISO | Quitar la ISO de la maquina |
| OPNsense tenia WAN y LAN cambiadas | Asignar le0 a WAN y le1 a LAN |
| OPNsense no bloqueaba el ping a 8.8.8.8 | Poner la regla de bloqueo arriba y resetear la tabla de estados |
| LinuxCliente no conectaba con la replica | Faltaba el DNS |
| Al unir pve3 al cluster se puso mal la IP | Editar corosync.conf y dejar el cluster en 192.168.41.0/24 |
| Error de certificados (596) en Proxmox | pvecm updatecerts --force y reiniciar pveproxy |
| El CT no arrancaba | Se habia bajado la plantilla arm64, se uso la amd64 |
| El CT no tenia red | Modo promiscuo "Permitir todo" en VirtualBox |
| VirtualBox se colgaba al arrancar la VM 101 | Falta de RAM, la VM se dejo sin sistema |
| pve2 se quedo sin red con la LAN | La copia del CT se hizo desde pve1 |

## Configuraciones criticas

| Maquina | Que es critico | Que pasa si falla |
|---|---|---|
| SrvCom | nftables.conf, ip_forward y la IP 192.168.41.1 | La LAN se queda sin internet |
| MikroTik / OPNsense | Regla de NAT y reglas del firewall | Sin NAT no hay internet, sin reglas no hay bloqueo |
| TrueNAS | Pool copias y carpeta backupa | No se pueden guardar ni recuperar las copias |
| WinSrv25 | AD DS y el dominio srv41.local | No funcionan los usuarios del dominio |
| Proxmox | corosync.conf, /etc/hosts y certificados | Los nodos no se ven y el cluster falla |

## Tiempos

| Incidencia | Tiempo |
|---|---|
| SrvCom: borrar nftables.conf y restaurar la copia | 1 min 18 s (de 19:02:26 a 19:03:44) |
| Proxmox: migrar el CT 100 a otro nodo | 21 s |
| Proxmox: migrar la VM 101 a otro nodo | 32 s |
