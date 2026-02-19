# FPGAs-Proyecto1

## Descripción del proyecto

## Explicación de los diseños

### Diseño 1 
### Diseño 2
El diseño 2 implementa el multiplicador de 64x64 bits utilizando una arquitectura segmentada de multiplicadores de 8x8 con suma de productos parciales y registros. El diseño presenta las siguientes etapas:
1. 64 Multiplicadores 8x8 que calculan los productos parciales de cada byte de los operandos de entrada: a y b.
2. Etapa de pipeline antes de desplazamiento.
3. 64 módulos de desplazamiento para extender los productos parciales a 128 bits.
4. Árbol de sumas de productos parciales segmentado:
   
   4.1. Nivel 1: 64 -> 32 sumas + Etapa de pipeline
   
   4.2. Nivel 2: 32 -> 16 sumas + Etapa de pipeline
   
   4.3. Nivel 3: 16 -> 8 sumas + Etapa de pipeline

   4.4. Nivel 4: 8 -> 4 sumas + Etapa de pipeline

   4.5. Nivel 5: 4 -> 2 sumas + Etapa de pipeline

   4.6. Nivel 6: 2 -> suma final + Etapa de pipeline
### Diseño 3

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

## Nombre del curso

   ### MP-6166 Diseño Avanzado con FPGAs

## Programa

   ### Maestría en Ingeniería Electrónica

## Institución

   #### Instituto Tecnológico de Costa Rica

## Profesor

   ### León Vega, Luis Gerardo

## Estudiantes

   ### Aguero Villagra, Leonardo Enrique
   ### Cruz Soto, Federico Alonso
   ### Fallas Mejía, Jorge Isaac
   ### Gutiérrez Quesada, Allan Mauricio
