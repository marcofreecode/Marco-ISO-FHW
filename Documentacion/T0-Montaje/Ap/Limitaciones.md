# T0 - Recursos físicos y limitaciones

## Recursos físicos

| Recurso | Clase (portátil) | Casa (sobremesa) |
|---|---|---|
| CPU | Intel Core Ultra 5 125H · 18 hilos | Intel Core i7-12700KF · 20 hilos |
| RAM | 32 GB | 32 GB |


Inventario completo en [T2](../../T2-Equipos_Perifericos/Ap/).

## Limitaciones

- **RAM**: las VMs suman unos 30,5 GB y el linux mint usa unos 5 GB, así que con 32 GB no se pueden arrancar todas a la vez.
- **Disco**: el entorno funciona desde un SSD externo por USB, más lento que un disco interno. Los discos virtuales suman más espacio del que hay libre, así que se crean como dinámicos.
- **CPU**: las VMs piden 18 hilos de cpu, que son todos los hilos del portátil de clase, iria limitado.

## Escenarios de uso

Las VMs se encienden por grupos según la prueba:

| Escenario | VMs encendidas | RAM aprox. (con el anfitrión) |
|---|---|---|
| Red y dominio | SrvCom + TrueNAS + WinSrv25 + Win11 + LinuxCliente |  24 GB |
| Proxmox | SrvCom + 3 nodos Proxmox + Win11 | 16 GB |
| Firewalls | Un servidor de comunicaciones cada vez + 1 cliente |  8–13 GB |