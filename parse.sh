#!/bin/bash
#
# https://github.com/sa7mon/wpe-parse
# https://danthesalmon.com
#
grep 'jtr NETNTLM' $1 | 
awk '{
	split($0,a,":"); 
	split(a[3],b,"$"); 
	print a[2]"::::"b[4]":"b[3];
}' | 
sed -e 's/^[ \t]*//' |
awk '!x[$1]++' FS=":" | sort
