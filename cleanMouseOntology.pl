#cleanMouseOntology
#this script reads in the full list of mouse GO annotations and spllits it into two lists
#one list is for Molecular function annotations and the other is for biological processes
#they both will have only entries with experimentally related evidence codes
#read in ontology of interest
open(IN,"mouse_gene_association_full.txt")||die("mouse_gene_association_full.txt does not open \n");
@raw = <IN>;

open(OUT1,">mouse_ontology_process.txt")||die("mouse_ontology_process.txt does not open \n");
open(OUT2,">mouse_ontology_function.txt")||die("mouse_ontology_function.txt does not open \n");
#loop through ontology
foreach $line (@raw){
	#check to make sure line doesn't start with !
	if(substr($line, 0, 1) ne "!"){
		#split line by tabs
		@columns = split("\t",$line);
		if($columns[6] eq "IDA" || $columns[6] eq "IEP" || $columns[6] eq "IGI" || $columns[6] eq "IMP" || $columns[6] eq "IPI" || $columns[6] eq "TAS" || $columns[6] eq "IC" || $columns[6] eq "EXP"){
			if($columns[8] eq "P"){
				print OUT1 "$line\n";
				
				}
			if($columns[8] eq "F"){
				print OUT2 "$line\n";
				
				}
			
			}
		
		}
	}
