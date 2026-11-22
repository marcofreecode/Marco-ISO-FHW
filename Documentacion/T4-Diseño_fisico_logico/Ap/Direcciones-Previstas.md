# T4 - Direcciones previstas


| Maquina | Adaptador | Red | IP | Mascara | Puerta de enlace |
|---|---|---|---|---|---|
| SRVCOM | 1 | NAT | DHCP | DHCP | DHCP |
| SRVCOM | 2 | intnet41 | 192.168.41.1 | 255.255.255.0 | - |
| MIKROTIK | 1 | NAT | DHCP | DHCP | DHCP |
| MIKROTIK | 2 | intnet41 | 192.168.41.2 | 255.255.255.0 | - |
| OPNSENSE | 1 | NAT | DHCP | DHCP | DHCP |
| OPNSENSE | 2 | intnet41 | 192.168.41.3 | 255.255.255.0 | - |
| TRUENAS | 1 | intnet41 | 192.168.41.10 | 255.255.255.0 | 192.168.41.1 |
| WINSRV25 | 1 | intnet41 | 192.168.41.30 | 255.255.255.0 | 192.168.41.1 |
| WIN11CLIENTE | 1 | intnet41 | 192.168.41.100 | 255.255.255.0 | 192.168.41.1 |
| LINUXCLIENTE | 1 | intnet41 | 192.168.41.101 | 255.255.255.0 | 192.168.41.1 |
| PROXMOX1 | 1 | proxmox | 192.168.141.21 | 255.255.255.0 | - |
| PROXMOX1 | 2 | intnet41 | 192.168.41.21 | 255.255.255.0 | 192.168.41.1 |
| PROXMOX2 | 1 | proxmox | 192.168.141.22 | 255.255.255.0 | - |
| PROXMOX2 | 2 | intnet41 | 192.168.41.22 | 255.255.255.0 | 192.168.41.1 |
| PROXMOX3 | 1 | proxmox | 192.168.141.23 | 255.255.255.0 | - |
| PROXMOX3 | 2 | intnet41 | 192.168.41.23 | 255.255.255.0 | 192.168.41.1 |


Nota: en el montaje el cluster de Proxmox acabo funcionando por la red intnet41 (192.168.41.21, .22 y .23) porque pve3 se unio con esa IP. La red proxmox (192.168.141.0/24) sigue configurada en los nodos pero el cluster no la usa. Ver Problemas.md de la T5.
