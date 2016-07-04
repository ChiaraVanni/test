# test
#### Images

An inline image ![Smaller icon](http://25.io/smaller/favicon.ico "Title here"), title is optional.

A ![Resize icon][2] reference style image.

[2]: http://resizesafari.com/favicon.ico "Title"


**Singletons**           
                        
Total | 5790292        
------| -------
TARA  | 2713509
OSD   | 786615
GOS   | 2290168

<img src="https://github.com/ChiaraVanni/test/blob/master/singletons_div_3D.png" width="100">


## Table of Contents
1. [TARA-OSD-GOS protein sequences classifications](#TARA-OSD-GOS protein sequences classification)
2. [Hierarchical clustering](#Hierarchical clustering)
3. [Filtering singletons & spurious ORFs](#Filtering singletons & spurious ORFs)
4. [BLAST/LAMBDA search vs UniProtKB](#BLAST/LAMBDA search vs UniProtKB)
5. [BLAST/LAMBDA search/alignment vs NCBI nr database](#BLAST/LAMBDA search/alignment vs NCBI nr database)
<br><br>

#TARA-OSD-GOS protein sequences classification
<br> 
We performed a functional analysis of protein sequences in terms of similarities to known protein families using the ultrafast protein classification ([UProC (version 1.2.0)](http://uproc.gobics.de/)) that is part of the CoMet web server and is available in terms of an open source C library.
<br> <br>

We used **Pfam (release 28.0)** as reference database.
<br> <br>


**Why we chose to run UProC:**

UProC is up to three orders of magnitude faster than profile-based methods and achieved up to 80% higher sensitivity on unassembled short reads (100 bp) from simulated metagenomes. UProC does not depend on a multiple alignment of family-specific sequences.
<br> <br>
[Script](https://github.com/ChiaraVanni/TARA-OSD-GOS-UNKNOWNS/blob/master/Processing_data/UProCvsPfam28.sh)

<br> 
###Results
The retrieved hits compose/represent the *KNOWN* fraction/families
While the no-hits (i.e the *UNKNOWN* families) will be further processed and categorized/divided into **"Genomic Unknowns"** (ORFs with unknown function, but similar to hypothetical genes in sequenced genomes) and **"Environmental Unknowns"** (ORFs with unknown function and no appreciable similarity to genes in sequenced genomes)
<br>

[Results (ToDo!)](link to owcloud-mpi-bremen.de)

<br> <br> <br>

#Hierarchical clustering
<br> 
We performed a hierarchical clustering, using [CD-HIT programs](http://weizhongli-lab.org/lab-wiki/doku.php?id=cd-hit-user-guide), to reduce sequence redundancy and improve the performance of the further sequence analyses.

First, we used cd-hit to cluster the input down to 60% identity.

Then, since the lowest threshold of CD-HIT is around 40%, we used PSI-CD-HIT, that clusters proteins at very low threshold (in our case 30%)
At the end we used the script clstr_rev.pl: that combines a .clstr file with its parent .clstr file

For an easier reading of the information contained in the cluster files we built summary tables, using the script clstr2text.pl 

[Scripts (ToDo!)]() only one script cd-hit, psi-cd-hit.pl and clstr_rev.pl (is possible)?

<br> 
###Results
Number of clusters at 30% --> repres sequences...
<br>
[Tables]()

