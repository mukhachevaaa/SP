#!/bin/bash
 
function create {
        while [ : ]; do
                read -p "Введите имя файла: "
                [ ! -e $REPLY ] && { $1 $REPLY; break; } || echo Error
        done
}
 
function isdir {
        while [ : ]; do
                read -p "Введите директорию назначения: "
                [ -d $REPLY ] && { echo $REPLY; break; } || echo Error 1>&2
        done
}
 
function move_ {
        while [ : ]; do
                read -p "Введите имя файла: "
                if [ -e $REPLY ]; then
                        [ $1 == mv ] && dest=$(isdir)
                        $1 $REPLY $dest
                        break
                fi
                echo Error
        done
}

while :
do
	echo "Выберите пункт меню[1-4]:"
	select arg in создать удалить переместить завершить
	do
			case $arg in
					создать) create touch; break;;
					удалить) move_ rm; break;;
					переместить) move_s mv; break;;
					завершить) exit; break;;
					*) echo Error;;
			esac
	
	done
done