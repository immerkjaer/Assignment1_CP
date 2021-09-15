How to run 
----------
*<code>java Search -W \<w> -R \<r> \<file> \<pattern> </code>*

-W is option for multiple warmup runs <br />
**\<w> specifies number of runs** <br />
-R is option for multiple runs <br />
**\<r> specifies number of runs**


GNUPlot command
---------------
<code>
set grid <br />
set xlabel "Run number" <br />
set ylabel "Time: Seconds" <br />
set xrange [-1:10] <br />
plot "data" title "Time each occurence used for execution" linetype 7 linecolor -1 <br />
</code>