# flutter_aeropuerto_inteligente

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Flutter — Mini App "Aeropuerto Inteligente"
Descripción general
Crea una mini aplicación con 5 pantallas para simular funcionalidades básicas de un aeropuerto: 1 Menú 4 Ejercicios.

Requisitos generales:

Debe usar go_router: ^14.0.0 para la navegación entre pantallas.
Al menos una pantalla debe tener una imagen (avión, pista, maleta, etc.).
Al menos una pantalla debe usar un ciclo para procesar datos (for/while).
#	Pantalla	Contenido visual	Comportamiento esperado
1	Menú del aeropuerto Inicio	
Título: "Aeropuerto Inteligente".
Texto corto de bienvenida al aeropuerto.
Tres botones:
Calculadora de equipaje
Plan de vuelos
Prioridad de embarque
Cada botón debe navegar a su pantalla usando GoRouter.
La pantalla solo sirve como menú principal.
2	Calculadora de equipaje Incluye imagen	
Imagen de una maleta o avión en la parte superior.
Campos:
Peso del equipaje en kg.
Límite permitido de equipaje.
Botón “Verificar equipaje”.
Texto que indique si el equipaje está dentro del límite o tiene sobrepeso.
Calcular la diferencia entre el peso ingresado y el límite.
Si el peso supera el límite, mostrar mensaje de sobrepeso.
Si está dentro del límite, mostrar mensaje de aprobación.
3	Plan de vuelos Usa ciclo	
Campos para registrar la duración (en minutos) de varios vuelos programados (por ejemplo, 4 o 5 vuelos).
Botón “Calcular tiempo total”.
Texto con:
Tiempo total en minutos.
Promedio de duración de los vuelos.
Recorrer los tiempos con un for o while para sumar.
Calcular promedio a partir del total y la cantidad de vuelos.
Mostrar un resumen con el total y el promedio.
4	Prioridad de embarque	
Campos para:
Tipo de pasajero (por ejemplo: Adulto mayor, Familia con niños, Pasajero regular).
Clase de boleto (Económica, Ejecutiva).
Botón “Calcular prioridad”.
Texto con la prioridad de embarque (alta, media o baja).
Usar condicionales para determinar la prioridad según tipo de pasajero y clase.
Por ejemplo, adulto mayor o ejecutiva ⇒ prioridad alta.
Mostrar un mensaje final con la prioridad asignada.
5	Lista dinámica de tasas de embarque Lista dinámica + cálculo	
Pantalla para gestionar una lista dinámica de pasajeros y su tasa de embarque.
Componentes sugeridos (sólo widgets por defecto de Flutter):
TextField para nombre del pasajero.
TextField numérico para monto de la tasa de embarque.
ElevatedButton “Agregar pasajero”.
ListView.builder para mostrar la lista de pasajeros.
Botón “Calcular total de tasas”.
Al pulsar “Agregar pasajero”:
Se valida que el nombre no esté vacío y el monto sea mayor a 0.
Se agrega un elemento con nombre y tasa a una lista en memoria.
La lista debe mostrar:
Nombre del pasajero.
Tasa de embarque correspondiente.
Posibilidad de eliminar un pasajero (botón/ícono).
Al pulsar “Calcular total de tasas”:
Recorrer la lista (for/for-in) sumando todas las tasas.
Calcular el promedio de tasa por pasajero.
Mostrar un texto con:
Total recaudado por tasas.
Promedio de tasa por pasajero.
Número total de pasajeros registrados.
Debe ser una ruta adicional manejada con go_router: ^14.0.0 desde el menú del aeropuerto.