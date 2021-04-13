#!/bin/bash
# картинка уменьшается до WIDTH
WIDTH=360
# Проверяем есть ли параметр
if [ -z $1 ]
    then 
       for IMAGE in $( ls -1 | grep .jpg | grep -v thumbnail.jpg); do
#Обрезаем расширение файла и вставляем новое имя
       IMAGE2=$(echo $IMAGE | sed 's/\..*//')
       IMAGE2=${IMAGE2}"_thumbnail"".jpg"
# Проверяем есть ли уже сжатый файл    
       if [ -f $IMAGE2 ]
            then
            echo "Файл $IMAGE уже имеет сжатую копию"
#Конвертируем
            else
            convert -resize $WIDTH $IMAGE $IMAGE2 
        fi    
done
#Если есть параметр
    else
#Читаем построчно файл
        while IFS= read -r IMAGE
        do
#Обрезаем расширение файла и вставляем новое имя
            IMAGE2=$(echo $IMAGE | sed 's/\..*//')
            IMAGE2=${IMAGE2}"_thumbnail"".jpg"
# Проверяем есть ли уже сжатый файл 
            if [ -f $IMAGE2 ]
                then
            echo "Файл $IMAGE уже имеет сжатую копию"
                else
#Конвертируем
            convert -resize $WIDTH $IMAGE $IMAGE2   
            fi
        done < $1
fi
