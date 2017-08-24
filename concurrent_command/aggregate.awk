#!/bin/awk -f
BEGIN {

}

{
  	split($1,h,"_")
  	r[h[2]] += $7
  	c[h[2]] += 1
}

END {
   for (x in r) {
        print "("x": Average Elapse "r[x] / c[x]
        totalR += r[x]
        totalC += c[x]
    }
    print "Total: Average Elapse "totalR / totalC
}

