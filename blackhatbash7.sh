#!/bin/bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt # \ : It is an escape character
grep -e "35.237.4.214" -e "13.66.139.0" log.txt

ps | grep TTY
ps | grep -i tty

grep -v "35.237.4.214" log.txt
grep -o "35.237.4.214" log.txt

awk '{print $1}' log.txt
cat log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt

awk '{print $1,$NF}' log.txt

touch example_csv.txt
echo "hola1,chao1" > example_csv.txt
echo "hola2,chao2" >> example_csv.txt
echo "hola3,chao3" >> example_csv.txt
awk -F',' '{print $1}' example_csv.txt

head log.txt
awk 'NR < 10' log.txt
grep "42.236.10.117" log.txt 
awk '{print $7}' log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt
grep "Mozilla" log.txt
grep "Godzilla" log.txt
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "Godzilla" newlog.txt

sed '1d' newlog.txt
sed -i '1d' newlog.txt
git diff newlog.txt

sed -i '$d' newlog.txt
sed 's/ //g' newlog.txt > newlog1.txt
grep " " newlog1.txt
grep -c " " newlog1.txt

sed '8,10d' newlog1.txt