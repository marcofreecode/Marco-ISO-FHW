# T2 - Equipos y perifericos

# Inventario | Equipo de casa

> Datos obtenidos con `dmidecode`, `lscpu`, `free`, `lsblk`, `smartctl`, `ip`, `ethtool`, `lspci`, `lsusb` y `upower`.

## Equipo y firmware

| Componente | Valor |
|---|---|
| Tipo | Sobremesa (montado por piezas) |
| Placa base | ASUS TUF GAMING B760M-PLUS |
| Versión BIOS | 1210 |
| Modo de arranque | UEFI |
| Secure Boot | Activado |
| TPM | Presente |

## CPU

| Componente | Valor |
|---|---|
| Modelo | Intel Core i7-12700KF |
| Núcleos / hilos | 12 núcleos / 20 hilos |
| Frecuencia máxima | 5,0 GHz |
| Caché L3 | 25 MiB |
| Virtualización | VT-x |

## Memoria RAM

| Componente | Valor |
|---|---|
| Total | 32 GB (2 × 16 GB) |
| Tipo | DDR5 DIMM · 4800 MT/s |
| Ranuras | 4 (2 ocupadas, **2 libres**) |
| Capacidad máxima | 256 GB (según `dmidecode`) |
| Swap | 15 GB + zram 7,8 GB |

## Almacenamiento

| Disco | Tipo | Capacidad | Conexión | Estado SMART | Uso |
|---|---|---|---|---|---|
| Corsair EX100U | SSD externo | 1 TB | USB | No legible por USB | **Disco de clase**: Linux Mint|


**Particiones del disco de clase**

| Partición | Tamaño | Usado | Montaje |
|---|---|---|---|
| sda1 | 508 MB | 4 % | `/boot/efi` |
| sda2 | 58 GB | 42 % | `/` |
| sda3 | 381 GB | 53 % (173 GB libres) | `/home` |

## Red

| Interfaz | Controlador | Velocidad | Estado |
|---|---|---|---|
| eno1 (cable) | Realtek RTL8125 (2,5 GbE) | 1000 Mb/s Full Duplex | Conectada |
| Bluetooth | TP-Link UB500 (USB) | — | — |

## Gráfica

| Componente | Valor |
|---|---|
| GPU | NVIDIA GeForce RTX 3060 (dedicada) |

## Periféricos

- Teclado Akko (por cable y receptor inalámbrico 2,4 GHz)
- Ratón Razer DeathAdder V3 Pro
- Receptor del Steam Controller
- Hub USB ASMedia ASM1074
- Controladores de iluminación ASUS AURA y Corsair Lighting Node Core

## Sistema operativo

| Componente | Valor |
|---|---|
| SO | Linux Mint 22.3 |
| Kernel | 6.8.0-146-generic |

## Alimentación

| Componente | Valor |
|---|---|
| Alimentación | Fuente ATX (sobremesa, sin batería) |

