# Inventario · Equipo de clase

> Datos obtenidos el 18/11/2026 con `dmidecode`, `lscpu`, `free`, `lsblk`, `smartctl`, `ip`, `ethtool`, `lspci`, `lsusb` y `upower`.

## Equipo y firmware

| Componente | Valor |
|---|---|
| Fabricante / modelo | ASUS ExpertBook B3605CCA (portátil) |
| Versión BIOS | B3605CCA.303 |
| Modo de arranque | UEFI |
| Secure Boot | Desactivado |
| TPM | Presente |

## CPU

| Componente | Valor |
|---|---|
| Modelo | Intel Core Ultra 5 125H |
| Hilos | 18 |
| Frecuencia | 400 MHz – 4,5 GHz |
| Caché L3 | 18 MiB |

## Memoria RAM

| Componente | Valor |
|---|---|
| Total | 32 GB (2 × 16 GB) |
| Tipo | DDR5 SODIMM · 5600 MT/s |
| Ranuras | 2 (ambas ocupadas) |
| Capacidad máxima | 64 GB |
| Swap | 15 GB + zram 7,6 GB |

## Almacenamiento

| Disco | Tipo | Capacidad | Conexión | Estado SMART | Uso |
|---|---|---|---|---|---|
| Corsair EX100U | SSD externo | 1 TB | USB 3 | No legible por USB | **Disco de clase**: Linux Mint y VMs |
| Samsung MZVMA1T0HCLD | SSD NVMe interno | 1 TB | PCIe NVMe | PASSED | Disco interno del portátil |

**Particiones del disco de clase**

| Partición | Tamaño | Usado | Montaje |
|---|---|---|---|
| sda1 | 508 MB | 4 % | `/boot/efi` |
| sda2 | 58 GB | 42 % | `/` |
| sda3 | 381 GB | 53 % (173 GB libres) | `/home` |

## Red

| Interfaz | Controlador | Velocidad | Estado |
|---|---|---|---|
| eno1 (cable) | Intel Ethernet | 1000 Mb/s Full Duplex | Conectada |
| wlp1s0 (Wi-Fi) | Realtek RTL8852BE (Wi-Fi 6) | — | Desconectada |
| Bluetooth | IMC Networks | — | — |

## Gráfica

| Componente | Valor |
|---|---|
| GPU | Intel Arc Graphics (Meteor Lake-P, integrada) |

## Periféricos

- Webcam USB FHD
- Ratón USB Amazon Basics
- Lector de tarjetas Realtek RTS5129

## Sistema operativo

| Componente | Valor |
|---|---|
| SO | Linux Mint 22.3 |
| Kernel | 6.8.0-146-generic |

## Alimentación

| Componente | Valor |
|---|---|
| Batería | ASUS · 50,4 Wh · 100 % de capacidad |

## Observaciones

- El sistema y las máquinas virtuales funcionan desde un **SSD externo por USB**. Es más lento que el NVMe interno y es el principal posible cuello de botella de disco.
- La RAM tiene las **2 ranuras ocupadas**. Para ampliar hasta 64 GB habría que sustituir los módulos.
- Hay **173 GB libres** en `/home` para las máquinas virtuales.
