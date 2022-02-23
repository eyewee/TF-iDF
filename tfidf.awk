
#!/usr/bin/awk

# awk -f tfidf.awk test/$i.tf df.df nb_de_fichiers

BEGIN{

	#print ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]

	#ARGC = 4 
	nb_de_fichiers = ARGV[--ARGC]
	#ARGV = 3 maintenant
	fichier_df = ARGV[--ARGC]
	#ARGC = 2 maintenant
	while ((getline < fichier_df) > 0)
		tab[$1] = $2
}

{
	if (NR > 0)	
		print $1, $2 * log(nb_de_fichiers / tab[$1])
	else
		print $1, $2 * 1
}
