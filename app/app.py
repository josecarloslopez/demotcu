import pytesseract
from PIL import Image

# Ruta de prueba
img = Image.open("test.png")

texto = pytesseract.image_to_string(img, lang="spa")
version="1.0"
print(version)
print("Texto detectado:")
print(texto)

