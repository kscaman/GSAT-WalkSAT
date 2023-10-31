clear
echo ">> GSAT Solver Runtime CDF <<"
echo ">> by Kevin Scaman adapted from Sina M.Baharlou <<"
echo ">> October 2023 <<"


file="uf20/uf20-01.cnf"
logfile="cdf.txt"
resultlog="cdf-"
n_samples=$((10000))
flip_max=$((10000))
rnd_method=$((-1))


gsat()
{
	count=$((0));
	echo ""> $logfile
	start_time=$(date +%s%N) ;
	for i in $(seq 1 $n_samples);
	do echo 'Solving : '$file' iteartion : '$i;
	./GSAT -i $file --iterations 1 --flip_max $flip_max --rnd_method $rnd_method --heuristic $heuristic_method  >> $logfile;
	count=$(($count+$?));
	# echo "\n\n">>$logfile
    done
	
	end_time=$((($(date +%s%N) - $start_time)/1000000)) ; 
	echo "Time elapsed : $end_time ms." >> $resultlog$heuristic_method".txt"
	echo "Solved "$count" formulas." >>  $resultlog$heuristic_method".txt"
}

heuristic_method=$((5))
gsat