myjob: a.txt source.txt result.txt
a.txt: b.txt c.txt
	cat b.txt c.txt > a.txt
source.txt:
	echo "this is the source" > source.txt
result.txt: source.txt
	cp source.txt result.txt
