#!bin/bash

generate_text_file() {
    content=$(base64 /dev/urandom | head -c 500)
    hash=$(echo -n "$content" | sha256sum | cut -d ' ' -f 1)
    echo "$content" > "text_$hash.txt"
}

# Función para generar y renombrar archivos de sonido
generate_sound_file() {
    ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" "sound_$(date +%s).wav"
}

# Función para generar y renombrar archivos de imagen
generate_image_file() {
    convert -size 100x100 xc: +noise Random "image_$(date +%s).png"
}

# Crear archivos de texto, sonido e imagen
generate_text_file
generate_sound_file
generate_image_file

echo "Archivos generados con éxito."

