# FPGAs-Proyecto1
Proyecto corto 1

## Descripción del proyecto

## Explicación de los diseños

## Instrucciones de construcción

## Árbol de archivos con su descripción
```
.
├─ D1/
│  ├─ src/
│  ├─ tb/
│  ├─ xdc/
│  └─ reports/
├─ D2/
│  ├─ mul64x64.sv          # Módulo top del multiplicador 64x64
│  ├─ mul64x64_wrapper.v   # Wrapper del top en Verilog
│  ├─ mul8x8.sv            # Módulo del multiplicador 8x8
│  ├─ shifter.sv           # Módulo de desplazamiento de productos parciales
│  └─ sum_tree.sv          # Árbol de sumas
└─ D3/
   ├─ src/
   ├─ tb/
   ├─ xdc/
   └─ reports/
```

## Tabla de resultados (AMD Kria KV260, 300 MHz)

| Parámetro | Diseño 1 | Diseño 2 | Diseño 3 |
|----------|----------|----------|----------|
| Timing / delay de la ruta crítica (ns) | 7.001 | 3.294 | _[ ]_ |
| Frecuencia máxima lograda (MHz) | 142.8 | 303.6 | _[ ]_ |
| Latencia (ciclos) | 1 | 7 | _[ ]_ |
| LUT (CLB LUTs) | 173 | 5475 | _[ ]_ |
| FF (CLB Registers) | 128 | 3664 | _[ ]_ |

-------

nombre del curso

programa

institución

profesor

estudiantes
