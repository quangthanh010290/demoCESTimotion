#! /usr/bin/env bash


des_dir="/home/pi/aos/ability/wave/"
desk_dir="/home/pi/aos/system/SMART_DESK/deskApp/"
pre_ip="pi@192.168.10"
pass="Sm@rtdesk2016"
file1="main.py DeskControl.py"
file2="control.py"
file3="output/$pc_num/1.json"
file4="deskRep"
#1
pc_num="1"
ip="$1"
file3="output/$pc_num/*.json"
echo "Copy data to IP:$ip, desk num:$pc_num"
sshpass -p "$pass" scp -r $file1 $pre_ip.$ip:$des_dir
sshpass -p "$pass" scp -r $file2 $pre_ip.$ip:$des_dir
sshpass -p "$pass" scp -r $file3 $pre_ip.$ip:$des_dir
sshpass -p "$pass" scp -r $file4 $pre_ip.$ip:$desk_dir
echo "Done IP:$ip, desk:$pc_num"
