#!/bin/sh
read -p "Directory (relative path) to scan: " dir
ls /$dir >> output.log
echo "Scan complete"
if [ $dir = "" ]
then
echo "Find in home directory" >> usagelog.log
else
echo "Find in directory " $dir >> usagelog.log
fi
read -r line < output.log
read -p "Scan top directory ($line)? Y/N " ans
if [ $ans = "y" ] || [ $ans = "Y" ]
then
cd $line
ls >> checklog.log
echo "Top Directory scan complete"
fi
read -p "Additional scan? Y/N " ans2
if [ $ans2 = "y" ] || [ $ans2 = "Y" ]
then
read -p "Relative path to scan: " dir2
ls /$dir2 >> output.log
echo "Additional scan complete"
fi
echo "Program complete."
echo "Exiting..."
