#
# ZSHELL function top10
#

my-top10() {
# Clear screen, print header
resize; clear; echo; date;

# Print Top 10 processes by CPU
echo "Top 10 Processes by CPU %";
echo "";
ps -eo user,%cpu,%mem,rsz,args,pid,lstart |\
		sort -rnk2 |\
    awk 'BEGIN {printf "%s\t%s\t%s\t%s\t%s\n","USER","%CPU","%MEM","RSZ","COMMAND","PID","Started"}\
      {printf "%s\t%g'%'\t%g'%'\t%d MB\t%-10s\n",$1,$2,$3,$4/1024,$5}' |\
    head -n10;
}
