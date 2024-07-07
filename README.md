
<h1 align="center"> 🌱🏣 Diseño de Base de Datos Ministerio de Medio Ambiente </h1>



> [!IMPORTANT]
> Este trabajo esta justificado en el libro practico teorico de Rodolfo Bertone y Pablo Thomas [Introducción a las Bases de Datos](https://github.com/Apedraza27/PROYECTO_BBDD_PortillaAndres_PedrazaAndres/blob/main/Introduccion_a_las_Bases_de_Datos_Rodolf.pdf) y a la logica empleada por el grupo encargadado del desarrollo de esta base de datos.

- <a href="andresportillaart@gmail.com">Enviarme un mensaje</a>
# Logica a Implementar
- **¿En que consiste el proyecto?**: Es un caso de estudio implantado para trabajar con requerimientos lo mas cercano a lo real:

<details>
  <summary>Caso De Estudio </summary>

El Ministerio del Medio Ambiente ha decidido crear un Software que permita manejar los
datos e información que se generan sobre los parques naturales gestionados por cada
departamento, en cada departamento se maneja una serie de requerimientos especiales que 
nos permitira abordar el proyecto de una mejor manera, aqui estan presentes los requerimientos:
<details>
  <summary>Requerimientos</summary>
   <br>
1. Un departamento puede tener varios parques naturales. <br> <br>
2. Todo departamento tiene solo una entidad responsable de los parques.  <br>  <br>
3. Aunque un departamento tiene una entidad responsable para sus parques, dicha entidad puede ser responsable de parques en varios departamentos. <br> <br>
4. Un parque puede ser compartido por más de un departamento. <br> <br>
5. Un parque natural se identifica por un nombre, el día en que fue declarado, tienevarias áreas identificadas por un nombre y una determinada extensión. Por motivos de eficiencia se desea favorecer las consultas que se refieran al número de parques existentes en cada departamento y la superficie total declarada de cada parque. <br> <br>
6. En cada área residen diferentes especies, las cuales pueden ser de tres (3) tipos: Vegetales, Animales o Minerales. <br> <br>
7. Cada especie tiene una denominación científica, una denominación vulgar y un número de inventario de individuos por área. <br> <br>
8. Del personal del parque se guarda el número de cedula, nombre, dirección, teléfonos (incluido móvil) y sueldo. Se distinguen los siguientes tipos de personal: <br>
            8.1. 001: Personal de Gestión: Registra los datos de los visitantes del parque y están ubicados en las entradas del mismo, las cuales están identificadas con un número) <br>
            8.2. 002: Personal de Vigilancia: Vigila un área determinada del parque que recorre
            en un vehículo el cual está identificado por un tipo y una marca). <br>
            8.3. 003: Personal de Conservación: Mantiene y conserva un área determinada del
            parque. Cada uno lo realiza en una especialidad determinada (Limpieza,
            Caminos, etc.).. <br>
            8.4. 004: Personal Investigador: Tiene una titulación y realizan funciones (incluso
            en equipo), a nivel de proyectos de investigación sobre una determinada
            especie. Un investigador trabaja en un proyecto analizando varias especies,
            una especie puede ser investigada por un investigador en varios proyectos y
            en un proyecto una especie puede ser investigada por varios investigadores. <br> <br>
9. Un proyecto de investigación tiene un presupuesto y un periodo de realización. <br> <br>
10. De un visitante se tiene identificación, nombre, dirección y profesión, puede alojarse
en cualquiera de los alojamientos de los que dispone el parque los cuales tienen
capacidad limitada y una categoría establecida.

</details>

  
</details>


Para asumir este trabajo se siguio una serie de pasos los cuales nos iban ayudar a poder diseñar y gestionar de manera eficiente esta base de datos, este readme sera un breve abrebocas de la documentacion final que podras encontrar en la parte final de este readme en su version de Documento como en Notion los cuales a traves del tiempo iran recibiendo cambios para mantener actualizada toda la informacion necesaria. <br>



 # Modelado de Datos
 El primer paso es relizar un modelo de datos, en donde se abarcara el modelo conceptual que fue con el que entendimos el ejercicio, pasando por el logico el cual es un poco mas robusto y llegando a su forma final que es el uml pero antes del modelo uml, se realiza una normalizacion.

---
## Conceptual
Es desarrollado durante la etapa de adquisición de conocimiento del problema; el analista se independiza del tipo de SGBD a utilizar y, por consiguiente, del producto de mercado. Asi, el modelo conceptual se desarrolla independientemente de su implementación final. Este modelo es especial ya que sentara las bases para la base de datos final sin embargo no significa que este sera el producto final ni mucho menos, es solo un boceto que se tendra a cuenta y a medida que vamos pasando por la creacion de modelos nos daremos cuenta de posibles errores y los arreglaremos en los futuros diagramas.
El modelo conceptual tiene ciertas caracteristicas:
### Características
- **Expresividad**: Busca capturar y presentar la semántica de los datos de manera óptima para abordar el problema.
- **Formalidad**: Requiere que cada elemento del modelo sea preciso y claramente definido, con una interpretación única, similar a la formalidad matemática.
- **Minimalidad**: Establece que cada elemento del modelo conceptual tenga una representación exclusiva y no pueda expresarse de otra manera.
- **Simplicidad**: Debe asegurar que el modelo sea fácil de comprender tanto para el cliente/usuario como para el desarrollador.

Ademas cuenta con unos componentes esenciales: 
- **Entidad**: Representa un objeto o concepto del mundo real que se distingue por sus propiedades. Por ejemplo, "Parque" o "Visitante" pueden ser entidades en un sistema.
- **Relación**: Define la asociación o conexión entre dos o más entidades. Por ejemplo, la relación "Visita" puede conectar las entidades "Parque" y "Visitante".
- **Atributos**: Son las características o propiedades que describen una entidad o una relación. Por ejemplo, un "Nombre" y "Edad" pueden ser atributos de la entidad "Visitante".

---

## Logico
El modelo lógico es una representación del modelo conceptual que comienza a considerar las restricciones y capacidades del SGBD elegido. A diferencia del modelo conceptual, el modelo lógico es más detallado y comienza a aproximarse a la implementación real de la base de datos.

### Diferencias del Modelo Conceptual

- **Especificidad Tecnológica**: Mientras que el modelo conceptual es independiente del SGBD, el modelo lógico empieza a tener en cuenta las particularidades del SGBD específico que se utilizará.
- **Nivel de Detalle**: El modelo lógico incluye más detalles sobre cómo se almacenarán y gestionarán los datos, incluyendo estructuras de datos, índices y restricciones de integridad.
- **Optimización**: Considera la eficiencia y optimización del acceso a los datos, lo cual no es un foco en el modelo conceptual.

### Características del Modelo Lógico

- **Eficiencia**: Debe ser diseñado para un acceso y manipulación de datos eficiente.
- **Integridad**: Define restricciones de integridad para asegurar la validez y consistencia de los datos.

### Elementos Eliminados del Modelo Conceptual

- **Abstracción**: El nivel de abstracción es menor en el modelo lógico, ya que se enfoca más en la implementación práctica.
- **Independencia del SGBD**: La independencia del SGBD se pierde en el modelo lógico, que se adapta a las especificaciones del sistema de gestión de bases de datos elegido.
- **Simplicidad**: Aunque la simplicidad sigue siendo un objetivo, se sacrifica en cierta medida para incluir detalles necesarios para la implementación.

---

## Normalizacion
> La **normalización** es un mecanismo que permite que un conjunto de tablas (que integran una BD) cumpla una serie de propiedades deseables. Estas propiedades consisten en evitar:

- Redundacia de datos.
- Anomalías de actualización.
- Pérdida de integridad de datos.

En simples palabras una normalizacion consiste en un serie de pasos a realizar para eliminar todos los datos "sobrantes" de la base de datos, dandole asi una base estable y congruente con la informacion almacenada.
Los caso a tener en cuenta son los siguientes: 
- Anomalías de inserción
- Anomalías de borrado
- Anomalías de modificación

Como se evitan dichas anomalinas, bueno gracias Edgar F. Codd que creo una serie de 3 pasos llamados las 3 formas normales, nos permiten establecer esta dicha base de datos solida que deseamos en nuestro aplicativo, aqui podras observar que son cada una, sin embargo si deseas saber como fueron implementadas en nuestro aplicativo puedes revisar los documentos anexados al readme: 
1. **Primera Forma Normal (1FN)**:
   - Requiere que cada celda de la tabla contenga un solo valor, evitando la repetición de grupos de datos.

2. **Segunda Forma Normal (2FN)**:
   - Se basa en la 1FN y asegura que todos los atributos no clave dependan completamente de la clave primaria, evitando la redundancia de datos.

3. **Tercera Forma Normal (3FN)**:
   - Construida sobre la 2FN, garantiza que los atributos no clave no dependan transitivamente de la clave primaria, evitando dependencias no directas.
---
## UML-Workbench

## Lógico

El modelo lógico es una representación del modelo conceptual que comienza a considerar las restricciones y capacidades del SGBD elegido. A diferencia del modelo conceptual, el modelo lógico es más detallado y comienza a aproximarse a la implementación real de la base de datos.

### Características del Modelo Lógico

- **Especificidad Tecnológica**: Empieza a tener en cuenta las particularidades del SGBD específico que se utilizará.
- **Nivel de Detalle**: Incluye detalles sobre cómo se almacenarán y gestionarán los datos, incluyendo estructuras de datos, índices y restricciones de integridad.
- **Optimización**: Considera la eficiencia y optimización del acceso a los datos.
- **Normalización**: Aplica reglas de normalización para reducir la redundancia y evitar anomalías en la base de datos.
- **Integridad**: Define restricciones de integridad para asegurar la validez y consistencia de los datos.

### Componentes Esenciales del Modelo Lógico

- **Tablas**: Representan entidades y sus relaciones en forma de tablas.
- **Llaves Primarias y Foráneas**: Establecen relaciones y aseguran la integridad referencial.
- **Índices**: Mejoran la velocidad de acceso a los datos.
- **Restricciones**: Aseguran la integridad y validez de los datos.

---

## UML WorkBench

El modelo en UML WorkBench es una representación detallada y técnica del sistema utilizando el Lenguaje Unificado de Modelado (UML). A diferencia del modelo lógico, el modelo en UML WorkBench ya considera la normalización y está más cercano a la implementación final.

### Diferencias del Modelo Lógico

- **Detalle de Comportamiento**: Además de los datos, UML WorkBench incluye detalles sobre el comportamiento del sistema, como métodos y diagramas de secuencia.
- **Normalización Integrada**: el modelo en UML WorkBench ya incorpora estas reglas en su diseño.
- **Documentación Estandarizada**: UML WorkBench ofrece una documentación más estandarizada y detallada, que es útil para el desarrollo y mantenimiento del sistema.

### Componentes Esenciales en UML WorkBench

- **Clases**: Representan entidades y son similares a las "Tablas" en el modelo lógico, pero con más detalle.
- **Relaciones**: Incluyen asociaciones, herencias y agregaciones entre clases.
- **Atributos**: Detallan las propiedades de las clases con tipos de datos específicos.
- **Métodos**: Definen el comportamiento de las clases.
- **Diagramas de Secuencia**: Modelan la interacción entre objetos en el tiempo.

### Elementos Eliminados del Modelo Lógico

- **Representación Tabular**: La representación tabular de tablas y relaciones es reemplazada por diagramas UML más visuales.
- **Menos Enfoque en SGBD**: Aunque se adapta al SGBD, UML WorkBench se enfoca más en el diseño general del sistema, incluyendo aspectos no relacionados directamente con el almacenamiento de datos.


---
 # Implementacion de Codigo
Aqui se implementa todo lo realizado anteriormente, para asi tener un trabajo mucho mas organizado y limpio, que maneje una ocurrencia correcta para evitar de esta manera los posibles errores al diseñar mal la base de datos
## Tablas
## Data
## Consultas
## Funciones
## Procedimientos
## Seguridad y Permisos
## Transacciones

# Tecnologias y herramientas 
## MySqL WorkBench
## Draw.io
## Notion
## ChatGpt



# Documento
https://docs.google.com/document/d/1qJ2iaN583x2NbMxq_fvyzoR0Giul8fzR/edit

# Integrantes
Andres Felipe Portilla

Andres Pedraza Peña
