start(){
while true
do
	date=$(date +%Y-%m-%d)
	filename=test-$(date +%Y-%m-%d).log
	if [ -e $filename ] ; then
		md5=$(wc -l $filename)
		#md5=$(md5sum $filename)
		line=$(( $(awk 'END{print NR}' $filename)+1 ))
		cat $filename 
		while true 
		do
			sleep 3
			date2=$(date +%Y-%m-%d)
			if [ $date2 != $date ] ; then
				break
			fi
			md52=$(wc -l $filename)
			#md52=$(md5sum $filename)
			if [ "$md52" != "$md5" ]  ; then 
				sed -n ''$line',$p' $filename
				line=$(( $(awk 'END{print NR}' $filename)+1 ))
			#	echo $line
			#	echo $md5
			#	echo $md52
				md5=$md52
			else 
				echo do something here
			fi
		done
	fi
done
}

stop(){
echo do something here
}



case $1 in
	start) 
	start
;;
	stop)
	stop 
;;
	*)
	echo 
;;
esac
