
SKIP=0
ENC=""
read WD
for i in $(seq 1 ${#WD})
do
	if [[ ${WD:i-1:1} = "%" ]]
	then
		SKIP=3
		ENC="${ENC}$(echo ${WD:i:2})"
		continue
	fi
	SKIP=$(($SKIP - 1))
	if [ $SKIP -gt 0 ]
	then
		continue
	fi
	if [[ -n $ENC && $SKIP -eq 0 ]]
	then
		echo -n $ENC | basenc --base16 -d
		echo -n "${WD:i-1:1}"
		ENC=""
	else
		echo -n "${WD:i-1:1}"
	fi
done
