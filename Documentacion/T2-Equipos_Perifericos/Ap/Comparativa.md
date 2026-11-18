# Comparativa de equipos y cuellos de botella

> Comparación del equipo de clase y el de casa a partir de los inventarios [Inventario-Clase.md](Inventario-Clase.md) e [Inventario-Casa.md](Inventario-Casa.md), pensando en el uso que les voy a dar: **ejecutar el entorno de pruebas con varias máquinas virtuales en VirtualBox**.

## 1. Tabla comparativa

| Componente | Clase (portátil) | Casa (sobremesa) | Mejor |
|---|---|---|---|
| Equipo | ASUS ExpertBook B3605CCA | Placa ASUS TUF GAMING B760M-PLUS | No aplica |
| CPU | Intel Core Ultra 5 125H | Intel Core i7-12700KF | Casa |
| Hilos | 18 | 20 (12 núcleos) | Casa |
| Frecuencia máx. | 4,5 GHz | 5,0 GHz | Casa |
| Caché L3 | 18 MiB | 25 MiB | Casa |
| Virtualización | VT-x | VT-x | Igual |
| RAM | 32 GB DDR5 SODIMM · 5600 MT/s | 32 GB DDR5 DIMM · 4800 MT/s | Igual |
| Ranuras RAM | 2 (ocupadas) · máx. 64 GB | 4 (2 libres) · máx. 256 GB | Casa |
| Disco del sistema y VMs | SSD externo Corsair EX100U por USB | El mismo SSD externo por USB | Igual |
| Espacio libre para VMs | 173 GB (`/home`) | 173 GB (`/home`, es el mismo disco) | Igual |
| Red por cable | Intel 1 Gb/s | Realtek 2,5 Gb/s (enlace a 1 Gb/s) | Casa |
| Wi-Fi | Realtek RTL8852BE (Wi-Fi 6) | No tiene | Clase |
| Gráfica | Intel Arc (integrada) | NVIDIA RTX 3060 | Casa |
| Firmware | UEFI · Secure Boot desactivado · TPM | UEFI · Secure Boot activado · TPM | Igual |
| Alimentación | Batería 50,4 Wh (100 %) | Fuente ATX | Casa |
| Portabilidad | Sí | No | Clase |

**Resumen:** el equipo de casa es más potente en CPU y es el único que se puede ampliar de RAM sin cambiar módulos. Los dos tienen la misma RAM (32 GB) y trabajan desde el mismo SSD externo, así que comparten los dos cuellos de botella principales.

## 2. Lo que necesita mi entorno

| Recurso | Total asignado a las VMs | Clase | Casa |
|---|---|---|---|
| RAM | unos 30,5 GB | 32 GB | 32 GB |
| vCPU | 18 | 18 hilos | 20 hilos |
| Disco | unos 380 GB | 173 GB libres | 173 GB libres |



## 3. Cuellos de botella

### RAM (cuello de botella grave): los dos equipos
- **Por que:** las VMs suman unos 30,5 GB y el anfitrión ya usa 4–6 GB. Con 32 GB no se pueden arrancar todas a la vez: el sistema empezaría a usar la swap (que está en el mismo disco USB) y todo iría a tirones.
- **Clase:** las 2 ranuras están ocupadas (máximo 64 GB), así que para ampliar habría que cambiar los dos módulos.
- **Casa:** tiene 2 ranuras libres.

### Disco (cuello de botella grave): los dos equipos
- **Por que:** el sistema y todas las VMs funcionan desde un **SSD externo por USB**, que es bastante más lento que los NVMe internos que tienen los dos equipos. Varias VMs leyendo y escribiendo a la vez saturan el disco antes que la CPU.
- **Espacio:** los discos virtuales suman unos 380 GB y solo hay 173 GB libres. Solo cabe si los discos virtuales son de **tamaño dinámico** y no se llenan.
- **Casa:** el SSD externo aparece conectado a través de un hub, posiblemente en **USB 2.0**, que es mucho más lento que USB 3. *(Pendiente de confirmar con `lsusb -t`.)*

### CPU (cuello de botella leve): sobre todo el de clase
- **Por que:** las VMs piden 18 vCPU. En clase son **todos los hilos** del portátil; en casa sobran 2. Además, un portátil baja la frecuencia cuando se calienta o cuando va con batería.

### Red: no es cuello de botella
- Las VMs se comunican por la red interna de VirtualBox, que no depende de la tarjeta física. En casa la tarjeta es de 2,5 Gb/s pero el enlace va a 1 Gb/s (lo limita el router o el cable); para este uso no influye.

## 4. Soluciones con el hardware que tengo

| Cuello de botella | Solución | Equipo |
|---|---|---|
| RAM | **Arrancar las VMs por turnos**: los tres servidores de comunicaciones (MikroTik, OPNsense y SrvCom) no hacen falta a la vez; con uno basta para cada prueba. | Los dos |
| RAM | **Ajustar la RAM asignada**: dar a cada VM lo mínimo que necesita para su prueba y apagar las que no se usan. | Los dos |
| RAM | Ampliar con **2 módulos DDR5 DIMM de 16 GB** en las ranuras libres (64 GB en total), sin tirar los actuales. | Casa |
| Disco | Conectar el SSD externo **directamente a un puerto USB 3 trasero** de la placa, sin pasar por el hub. | Casa |
| Disco | Guardar las VMs más pesadas (nodos Proxmox, Windows Server) en el **NVMe interno**, si se puede usar. | Los dos |
| Disco | Usar **discos virtuales dinámicos** y borrar instantáneas antiguas para no quedarse sin espacio. | Los dos |
| CPU | Dar **1 vCPU** a las VMs ligeras (MikroTik, OPNsense, SrvCom, clientes) y reservar 2 para las que lo necesitan. | Los dos |
| CPU | Trabajar con el portátil **enchufado** y en modo de energía de **rendimiento**. | Clase |

## 5. Conclusión

- **El equipo de casa es el mejor para trabajar con el entorno completo**: más CPU y RAM ampliable.
- **El de clase sirve, pero hay que arrancar menos VMs a la vez** y repartir bien la CPU.
- En los dos, el límite real lo marcan **la RAM y el disco USB**, no la CPU. Estos cuellos de botella se comprobarán con datos en las pruebas del Apto+ y en la tarea 7.
