# Pruebas de red

La red esta montada y se comprueba con ping, traceroute, tablas de rutas y la configuracion de las interfaces.

## Interfaces

![srvcom](../../../Medios/T5/srvcom_red.png)

SrvCom: enp0s3 en NAT (10.0.2.15) y enp0s8 en la LAN (192.168.41.1). La ruta por defecto va por 10.0.2.2.

![mikrotik](../../../Medios/T5/mikrotik_red2.png)

MikroTik: ether1 en NAT y ether2 con la 192.168.41.2.

![mikrotik rutas](../../../Medios/T5/mikrotik_red3.png)

Tabla de rutas del MikroTik, la ruta por defecto va por 10.0.2.2.

![opnsense](../../../Medios/T5/opn_interfaces.png)

OPNsense: WAN 10.0.2.15 y LAN 192.168.41.3.

![truenas](../../../Medios/T5/truenas_red.png)

TrueNAS con la 192.168.41.10 y la ruta por defecto por SrvCom.

![proxmox](../../../Medios/T5/pve1_red.png)

pve1 con la 192.168.41.21 en vmbr0.

![winsrv](../../../Medios/T5/winsrv_red.png)

WinSrv25 con la 192.168.41.30.

![win11](../../../Medios/T5/cliwin_red.png)

Win11Cliente con la 192.168.41.100.

![linux](../../../Medios/T5/clilix_red.png)

LinuxCliente con la 192.168.41.101, su tabla de rutas y ping a 1.1.1.1.

## Ping y traceroute

![ping](../../../Medios/T5/cliwin_prueba1.png)

Desde Win11Cliente responde SrvCom (red interna) y 1.1.1.1 (internet).

![tracert srvcom](../../../Medios/T5/cliwin_pruebared2.png)

Saliendo por SrvCom: 192.168.41.1, despues 10.0.2.2 (NAT de VirtualBox), 192.168.1.1 (router de casa) e internet.

![tracert mikrotik](../../../Medios/T5/cliwin_mikro_prueba.png)

Saliendo por MikroTik el primer salto es 192.168.41.2.

![tracert opnsense](../../../Medios/T5/win_tracert_opn.png)

Saliendo por OPNsense el primer salto es 192.168.41.3.
