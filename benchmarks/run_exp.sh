clear
echo ">> GSAT Solver Runtime CDF <<"
echo ">> by Kevin Scaman adapted from Sina M.Baharlou <<"
echo ">> October 2023 <<"


file="uf150/"
logfile="log_uf150.txt"
resultlog="log_uf150l-"
iterations=$((10000))
flip_max=$((10000))
rnd_method=$((-1))


gsat()
{
	count=$((0));
	echo ""> $logfile
	start_time=$(date +%s%N) ;
	echo 'Solving : '$file;
	./GSAT -i $file --iterations $iterations --flip_max $flip_max --rnd_method $rnd_method --heuristic $heuristic_method  >> $logfile;
	count=$(($count+$?));
	echo "\n\n">>$logfile
	
	end_time=$((($(date +%s%N) - $start_time)/1000000)) ; 
	echo "Time elapsed : $end_time ms." >> $resultlog$heuristic_method".txt"
	echo "Solved "$count" formulas." >>  $resultlog$heuristic_method".txt"
}

heuristic_method=$((5))
gsat
