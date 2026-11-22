# OPNsense

- Sistema: OPNsense 26.7 (amd64)
- WAN (le0): NAT, 10.0.2.15 por DHCP
- LAN (le1): intnet41, 192.168.41.3/24
- Funcion: firewall de la red, alternativa a SrvCom y MikroTik

## Version

![consola](../../../Medios/T5/opn_cons_red.png)

En la consola sale la version 26.7 y las dos interfaces con sus IPs. La web se abre en https://192.168.41.3.

![version](../../../Medios/T5/opn_version.png)

En Sistema > Firmware se ve la version 26.7 y que se comprobaron las actualizaciones.

## Usuario

![usuarios](../../../Medios/T5/opn_usr.png)

Ademas de root se creo el usuario marco dentro del grupo admins para administrar.

## Red

![interfaces](../../../Medios/T5/opn_interfaces.png)

WAN con la 10.0.2.15 y LAN con la 192.168.41.3.

![ping](../../../Medios/T5/opn_ping.png)

Desde Diagnosticos el OPNsense llega a 1.1.1.1 sin perder paquetes.

## NAT y reglas

![nat](../../../Medios/T5/opn_nat_firewal.png)

El NAT de salida esta en automatico. Saca la red LAN por la direccion de la WAN.

![reglas](../../../Medios/T5/opn_reglasfire.png)

En la LAN la regla BLOQUEADO va primero y tira el ICMP hacia el alias google_dns (8.8.8.8). Debajo esta PERMITIDO, que deja salir el resto de la LAN.

## Pruebas desde Win11Cliente

![config cliente](../../../Medios/T5/wind_config_opn_prueb.png)

Se cambia la puerta de enlace de Win11Cliente a 192.168.41.3.

![ping cliente](../../../Medios/T5/winpruebpingopn.png)

1.1.1.1 responde y 8.8.8.8 no.

![tracert](../../../Medios/T5/win_tracert_opn.png)

El primer salto ahora es el OPNsense (192.168.41.3).

![log bloqueado](../../../Medios/T5/opn_fire_bloqueado.png)

En el log en vivo salen en rojo los ping de 192.168.41.100 a 8.8.8.8 con accion block y etiqueta BLOQUEADO.

![log permitido](../../../Medios/T5/opn_fire_permitido.png)

Y en verde las conexiones del cliente a internet (puerto 443 y DNS al 53) con accion pass y etiqueta PERMITIDO.

## Copia

![copia](../../../Medios/T5/opn_descarga_seg.png)

Desde Sistema > Configuracion > Copias de seguridad se descarga el xml con toda la configuracion y se guarda en TrueNAS.

## Prueba de fallo y restauracion

![deshabilitar](../../../Medios/T5/opn_deshabi_itar.png)

Se deshabilita la regla BLOQUEADO a proposito.

![deshabilitada](../../../Medios/T5/opn_deshabilitado.png)

La regla sale en gris.

![sin bloqueo](../../../Medios/T5/opn_prueba_win_deshabilitado.png)

Ahora el ping a 8.8.8.8 responde, el bloqueo ya no funciona.

![restaurar](../../../Medios/T5/opn_rest_copia.png)

Se restaura el xml descargado antes.

![restaurado](../../../Medios/T5/opn_copia-restaruradobien.png)

Despues de reiniciar la regla BLOQUEADO vuelve a estar activa.

![bloqueo otra vez](../../../Medios/T5/opn_copia_novaping_despues.png)

Y el ping a 8.8.8.8 vuelve a estar bloqueado.
