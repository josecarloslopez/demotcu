FROM python:3.9-slim

# Evitar preguntas en la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar e instalar dependencias del sistema + Tesseract
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    tesseract-ocr-spa \
    tesseract-ocr-eng \
    libtesseract-dev \
    libleptonica-dev \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar dependencias Python
COPY app/requirements.txt .

# Instalar dependencias Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar tu aplicación
COPY . .

# Variable para que pytesseract encuentre el binario
ENV TESSERACT_PATH=/usr/bin/tesseract

# Comando por defecto
CMD ["python", "app.py"]

