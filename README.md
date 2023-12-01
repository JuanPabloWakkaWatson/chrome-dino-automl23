# chrome-dino-automl23

## Descripción General del Proyecto

Este proyecto aplica técnicas de Machine Learning, específicamente Q-Learning, para entrenar a un dinosaurio a navegar en el popular juego offline de Google Chrome. Inspirándonos en el tutorial de Max Teaches Tech y utilizando Pygame y PyTorch, hemos desarrollado una versión personalizada del juego que se integra con nuestro modelo de aprendizaje por refuerzo.

### El Juego del Dinosaurio

El juego del dinosaurio de Google Chrome, conocido por su simplicidad y desafío, se activa cuando no hay conexión a Internet. El jugador debe guiar al dinosaurio a través de un desierto, esquivando obstáculos como cactus y enfrentando desafíos crecientes en dificultad y velocidad.

### Objetivos del Proyecto

El objetivo principal es aplicar Q-Learning para entrenar al dinosaurio a maniobrar eficientemente en el juego. Buscamos explorar las capacidades y limitaciones de Q-Learning en un entorno de juego sencillo pero dinámico.

## Tecnologías y Herramientas

### Paqueterías Utilizadas

- **Pygame**: Para recrear el juego y proporcionar una interfaz gráfica.
- **PyTorch**: Biblioteca de aprendizaje profundo para entrenar redes neuronales.
- **Numpy**: Manejo de cálculos numéricos y manipulación de matrices.
- **Pandas**: Análisis de datos (aunque no inicialmente mencionado).
- **Assets del Juego**: Provenientes del repositorio [chrome-dinosaur](https://github.com/maxontech/chrome-dinosaur/tree/master/Assets).
- **Otros módulos de Python**: `os`, `random`, `sys`, `math`, `time` para funciones auxiliares.

### Configuraciones Iniciales

#### Aspectos Clave del Juego

- **Dimensiones de la Pantalla**: Emulan la experiencia del juego original.
- **Velocidad del Juego**: Configuración de la velocidad y su incremento progresivo.

#### Parámetros de Entrenamiento

- **Memoria de Replay**: `INIT_REPLAY_MEM_SIZE = 5_000`, `REPLAY_MEMORY_SIZE = 45_000`, `MIN_REPLAY_MEMORY_SIZE = 1_000`.
- **Minibatch y Descuento**: `MINIBATCH_SIZE = 64`, `DISCOUNT = 0.95`.
- **Actualización del Modelo**: `UPDATE_TARGET_THRESH = 5`.
- **Estrategia Epsilon-Greedy**: `EPSILON_INIT = 0.45`, `EPSILON_DECAY = 0.997`, `MIN_EPSILON = 0.05`.

### Importaciones de Bibliotecas

- Se detallan las importaciones clave de Pygame y PyTorch.

## Explicación de Estrategias y Parámetros

Esta sección profundiza en la justificación y la importancia de los hiperparámetros y estrategias seleccionados.

### Hiperparámetros Clave

- **Memoria de Replay**: Permite al modelo aprender de una gama amplia de experiencias.
- **Tamaño del Minibatch y Factor de Descuento**: Equilibran eficiencia y estabilidad en el entrenamiento.
- **Actualización del Modelo Objetivo**: Mantiene la estabilidad del aprendizaje.
- **Estrategia Epsilon-Greedy**: Balancea exploración y explotación.

### Racionalización de las Decisiones

Los hiperparámetros están elegidos para adaptarse a las características únicas del juego, asegurando un aprendizaje efectivo y estable.

## Conclusión

Este proyecto demuestra un enfoque cuidadosamente equilibrado y considerado en la aplicación de Q-Learning al juego del dinosaurio de Google Chrome. La combinación de tecnologías y estrategias seleccionadas refleja un compromiso con la efectividad y robustez del modelo, garantizando no solo un aprendizaje eficaz sino también la capacidad de adaptarse a las dinámicas cambiantes del juego.