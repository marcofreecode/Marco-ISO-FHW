# MikroTik

- Sistema: MikroTik CHR (RouterOS 7.25.1)
- ether1: NAT (10.0.2.15 por DHCP)
- ether2: intnet41, 192.168.41.2/24
- DNS: 1.1.1.1
- Funcion: router de la red, alternativa a SrvCom

Todo se configuro desde la web (WebFig).

## Version

![version](../../../Medios/T5/mikrotik_version.png)

Se instalo la 7.24.5 y se actualizo a la 7.25.1. Sale que el sistema esta al dia.

## Usuario

![usuarios](../../../Medios/T5/mikrotik_usr.png)

Ademas de admin se creo el usuario marco con grupo full para administrar.

## Red

![dns](../../../Medios/T5/mikrotik_red.png)

DNS 1.1.1.1.

![direcciones](../../../Medios/T5/mikrotik_red2.png)

ether1 coge la 10.0.2.15 por DHCP (sale con la D de dinamica) y ether2 tiene la 192.168.41.2 fija.

![rutas](../../../Medios/T5/mikrotik_red3.png)

La ruta por defecto va por 10.0.2.2, que es el NAT de VirtualBox.

![ping](../../../Medios/T5/mikrotik_ping.png)

El MikroTik llega a 1.1.1.1.

## Firewall

![reglas](../../../Medios/T5/mikrotik_reglas.png)

Reglas en forward por orden:
1. Se acepta lo que ya esta establecido.
2. Se bloquea el ping de la LAN a 8.8.8.8.
3. Se acepta lo nuevo que va de LAN a WAN.
4. Se tira todo lo demas.

## Pruebas desde Win11Cliente

![ip cliente](../../../Medios/T5/cliwin_mikroip.png)

Para probar se cambia la puerta de enlace de Win11Cliente a 192.168.41.2.

![ping cliente](../../../Medios/T5/cliwin_mikroping.png)

1.1.1.1 responde y 8.8.8.8 no, porque esta bloqueado.

![log](../../../Medios/T5/cliwin_mikro_log.png)

En el log salen las conexiones de ether2 a ether1 como PERMITIDO y los ping a 8.8.8.8 como BLOQUEADO.

![tracert](../../../Medios/T5/cliwin_mikro_prueba.png)

El primer salto ahora es el MikroTik (192.168.41.2) en vez de SrvCom.

## Copia

![copia](../../../Medios/T5/mikro_copia.png)

Se exporta la configuracion a mikrotik-config.rsc.

![contenido](../../../Medios/T5/mikro_copiacontenido.png)

El rsc tiene en texto las listas WAN y LAN, la IP, el DHCP de ether1, el DNS, las reglas del firewall y el NAT.

![backup](../../../Medios/T5/mikrotikBackupBUENO.png)

Tambien se hace un backup completo (mikrotik-backup.backup). Los dos ficheros se descargan y se guardan en TrueNAS.

## Prueba de fallo y restauracion

![quitar nat](../../../Medios/T5/mikro_remove_nat.png)

Se borra la regla de NAT a proposito.

![sin nat](../../../Medios/T5/mikro_sinNAT.png)

Ya no hay ninguna regla de NAT.

![sin internet](../../../Medios/T5/mirko_sinNAT_novaping.png)

Win11Cliente ya no llega a 1.1.1.1.

![restore](../../../Medios/T5/mikro_restore.png)

Se restaura mikrotik-backup.backup desde Files.

![despues](../../../Medios/T5/mikro_despuesdebackup.png)

Despues de reiniciar vuelve a estar la regla masquerade y el cliente vuelve a tener internet.
