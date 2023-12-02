# Utilizar una imagen base de Python
FROM python:3.8-slim

# Instalar dependencias del sistema para Pygame en pasos separados
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing python3 python3-pip 
RUN apt-get install -y --no-install-recommends --fix-missing python3-setuptools python3-wheel python3-dev
RUN apt-get install -y --no-install-recommends --fix-missing libfreetype6-dev libjpeg-dev libpng-dev
RUN apt-get install -y --no-install-recommends --fix-missing libblas-dev liblapack-dev gfortran
RUN apt-get install -y --no-install-recommends --fix-missing libsdl2-2.0-0 libsdl2-image-2.0-0 libsdl2-mixer-2.0-0 libsdl2-ttf-2.0-0
RUN apt-get install -y --no-install-recommends --fix-missing xorg-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo del notebook y los recursos al contenedor
COPY "ProyectoFinalChatbotsPyTorch.ipynb" /app
COPY Assets/ /app/Assets/
COPY models/ /app/models/
COPY modelsMark1/ /app/modelsMark1/

# Instalar las librerías de Python necesarias
RUN pip install notebook pygame torch pandas numpy tqdm sqlalchemy

# Exponer el puerto para el notebook
EXPOSE 8888

# Configuración para ejecutar Pygame en modo sin cabeza
ENV SDL_VIDEODRIVER=dummy

# Ejecutar Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
