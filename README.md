# chrome-dino-automl23

## Descripción del Proyecto

Este proyecto utiliza técnicas de Machine Learning, específicamente Q-Learning, junto con PyTorch para entrenar a un dinosaurio en el popular juego offline de Google Chrome. Hemos recreado el juego utilizando el módulo Pygame y nos hemos inspirado en el tutorial de Max Teaches Tech para desarrollar una versión personalizada que se integra con nuestro modelo de aprendizaje por refuerzo.

### Juego del Dinosaurio

El juego del dinosaurio de Google Chrome es un juego simple pero desafiante que se activa cuando no hay conexión a Internet. El objetivo es guiar a un dinosaurio a través de un desierto, esquivando obstáculos como cactus y, más adelante en el juego, diferentes tipos de desafíos. El juego aumenta su dificultad progresivamente, incrementando la velocidad y la variedad de obstáculos a medida que el jugador avanza.

### Objetivo del Proyecto

El principal objetivo de este proyecto es aplicar el algoritmo de Q-Learning para entrenar al dinosaurio a navegar a través del juego de manera eficiente. A través de este enfoque, buscamos explorar las capacidades y limitaciones del Q-Learning en un entorno de juego relativamente simple pero dinámico.

## Paqueterías Utilizadas

El proyecto se apoya en varias bibliotecas y herramientas clave para implementar el algoritmo de Q-Learning y la interfaz del juego:

- **Pygame**: Utilizada para recrear el juego del dinosaurio, proporcionando una interfaz gráfica para la interacción y visualización del progreso del modelo.
- **PyTorch**: Una biblioteca de aprendizaje profundo que nos permite implementar y entrenar redes neuronales con gran flexibilidad y eficiencia.
- **Numpy**: Fundamental para el manejo de cálculos numéricos, especialmente en la manipulación de matrices y vectores, que son esenciales en el aprendizaje por refuerzo.
- **Pandas**: Aunque no se menciona explícitamente en las primeras celdas, es común en proyectos de ML para el manejo y análisis de datos.
- **Assets del Juego**: Los assets necesarios para recrear el juego fueron tomados del siguiente repositorio: [chrome-dinosaur](https://github.com/maxontech/chrome-dinosaur/tree/master/Assets).
- **Otros módulos de Python como `os`, `random`, `sys`, `math`, y `time`** se utilizan para diversas funciones auxiliares y de soporte.

## Configuraciones Iniciales

En esta sección, detallamos las configuraciones iniciales clave y las importaciones de bibliotecas necesarias para el funcionamiento del proyecto. Estas configuraciones son cruciales para el correcto entrenamiento y funcionamiento del modelo de Q-Learning aplicado al juego del dinosaurio.

### Configuraciones de la Pantalla y del Juego

- **Dimensiones de la Pantalla**: Las dimensiones de la pantalla del juego se establecen para emular la experiencia del juego del dinosaurio en Google Chrome.
- **Velocidad del Juego**: La velocidad inicial del juego y su incremento progresivo son configurados para simular la dificultad creciente en el juego real.

### Parámetros de Entrenamiento

El entrenamiento de la red neuronal se realiza con los siguientes parámetros:

- **Tamaños de Memoria de Replay**: 
  - `INIT_REPLAY_MEM_SIZE = 5_000` y `REPLAY_MEMORY_SIZE = 45_000`: Una memoria de replay grande permite al agente aprender de una amplia gama de experiencias anteriores, lo que es crucial para generalizar y adaptarse a diferentes patrones en el juego.
  - `MIN_REPLAY_MEMORY_SIZE = 1_000`: Este tamaño mínimo es esencial antes de comenzar el entrenamiento, asegurando que el modelo tenga suficientes datos para un entrenamiento efectivo.

- **Tamaño del Minibatch y Factor de Descuento**: 
  - `MINIBATCH_SIZE = 64`: Este tamaño de minibatch equilibra la eficiencia computacional con la estabilidad del entrenamiento, permitiendo que la red aprenda de una variedad de experiencias simultáneamente.
  - `DISCOUNT = 0.95`: El factor de descuento reduce el valor de las recompensas futuras, enfocando al agente en recompensas a corto plazo pero sin descuidar las consecuencias a largo plazo.

- **Actualización del Modelo Objetivo**: 
  - `UPDATE_TARGET_THRESH = 5`: Actualizar los pesos del modelo objetivo cada 5 episodios contribuye a la estabilidad del aprendizaje, evitando cambios drásticos y proporcionando estimaciones consistentes de los valores Q objetivo.

- **Estrategia Epsilon-Greedy**: 
  - `EPSILON_INIT = 0.45`, `EPSILON_DECAY = 0.997`, `MIN_EPSILON = 0.05`: Estos valores controlan la tasa de exploración/explotación. Un `epsilon` inicial más alto permite una exploración amplia al principio, reduciéndose gradualmente para enfocarse más en la explotación de la estrategia aprendida.

### Importaciones de Bibliotecas

Las siguientes bibliotecas son fundamentales para el proyecto:

- **Pygame**: Utilizada para la implementación de la interfaz gráfica del juego.
- **PyTorch**: Empleada para la creación y entrenamiento de la red neuronal. PyTorch proporciona una plataforma flexible y potente para implementar redes neuronales con capacidades de aprendizaje profundo.

### Conclusión

La configuración inicial y las importaciones son un aspecto crucial del proyecto, ya que establecen la base sobre la cual se construye y entrena el modelo de Q-Learning. La selección cuidadosa de los parámetros y herramientas refleja un enfoque equilibrado y considerado, adecuado para las características específicas del juego del dinosaurio. Este enfoque ayuda a garantizar que el modelo de aprendizaje por refuerzo no solo aprenda efectivamente, sino que también mantenga un equilibrio entre aprender de experiencias recientes y recordar lecciones pasadas.

## Explicación de Parámetros y Estrategias

Esta sección profundiza en los hiperparámetros y estrategias clave empleados en el entrenamiento del modelo de Q-Learning para el juego del dinosaurio. La elección cuidadosa de estos parámetros es fundamental para el éxito del entrenamiento y la efectividad del modelo en el juego.

### Hiperparámetros del Modelo

Los hiperparámetros del modelo son seleccionados con el objetivo de optimizar el rendimiento y la eficiencia del aprendizaje. A continuación, se detallan los hiperparámetros más significativos:

- **Tamaño de la Memoria de Replay**:
  - `INIT_REPLAY_MEM_SIZE = 5_000` y `REPLAY_MEMORY_SIZE = 45_000`: Estos tamaños de memoria permiten al modelo aprender de un conjunto extenso de experiencias previas, fundamental para la generalización y adaptabilidad.
  - `MIN_REPLAY_MEMORY_SIZE = 1_000`: Este valor asegura que el modelo tenga suficientes experiencias de aprendizaje antes de comenzar el entrenamiento, lo cual es vital para un aprendizaje efectivo y balanceado.

- **Tamaño del Minibatch y Factor de Descuento**:
  - `MINIBATCH_SIZE = 64`: Un tamaño de minibatch de 64 ofrece un balance óptimo entre eficiencia y estabilidad, permitiendo que el modelo aprenda de un conjunto diverso de experiencias.
  - `DISCOUNT = 0.95`: El factor de descuento equilibra la importancia de las recompensas a corto y largo plazo, incentivando al modelo a tomar decisiones que son beneficiosas tanto inmediatamente como en el futuro.

- **Actualización del Modelo Objetivo**:
  - `UPDATE_TARGET_THRESH = 5`: Esta estrategia de actualización asegura que el modelo objetivo se actualice a un ritmo que promueva la estabilidad en el aprendizaje, proporcionando estimaciones consistentes y evitando oscilaciones extremas en el rendimiento.

- **Estrategia Epsilon-Greedy**:
  - `EPSILON_INIT = 0.45`, `EPSILON_DECAY = 0.997`, `MIN_EPSILON = 0.05`: La estrategia epsilon-greedy equilibra la exploración de nuevas estrategias con la explotación de lo que el modelo ya ha aprendido. Comenzando con una tasa de exploración más alta, el modelo tiene la libertad de explorar ampliamente al principio, lo cual se reduce gradualmente para enfocarse en la explotación de estrategias conocidas a medida que el modelo se vuelve más competente.

### Racionalización de las Decisiones

La elección de estos hiperparámetros refleja un enfoque cuidadoso y deliberado, diseñado para adaptarse a las características únicas del juego del dinosaurio. Por ejemplo, el tamaño de la memoria de replay y la estrategia de actualización del modelo objetivo se eligen para asegurar que el modelo aprenda de manera efectiva sin perder la estabilidad. La estrategia epsilon-greedy se calibra para adaptarse al equilibrio entre exploración y explotación necesario en este juego, donde las acciones (como saltar, correr o agacharse) tienen diferentes duraciones y efectos en el juego.

### Conclusión

La selección de estos hiperparámetros y estrategias demuestra un enfoque equilibrado y reflexivo, que considera tanto las necesidades de eficiencia en el entrenamiento como las particularidades del entorno del juego del dinosaurio. Este enfoque meticuloso ayuda a asegurar que el modelo de aprendizaje no solo sea eficaz en su desempeño, sino también robusto y adaptable a las cambiantes dinámicas del juego.


