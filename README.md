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

<div id='TARA-OSD-GOS protein sequences classification'/>
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
<div id='Hierarchical clustering'/>
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


<br> <br> <br>
<div id='Filtering singletons & spurious ORFs'/>
#Filtering singletons & spurious ORFs
<br>

##Filter out singletons
<br>
Basically we removed the clusters with only one sequence, (in Table_clstr30_from90.csv, at 30%)


##Filter out spurious
<br>
We identified all the spurious ORFs searching AntiFam profile HMMs library against our set of already singletons-filtered sequences, using the hmmsearch program of the HMMER package (v. 3.1b2)


[Script]() to update the numbers after uproc-pfam28

<br> 
###Results

**Singletons**                             

Total | 5790292
------| -------
TARA  | 2713509
OSD   | 786615
GOS   | 2290168


**Spurious**

Total | 3310
------| -------
TARA  | 2046
OSD   | 392
GOS   | 872


<br> <br><br> 
<div id='BLAST/LAMBDA search vs UniProtKB'/>
#BLAST/LAMBDA search vs UniProtKB
<br>
##UniProtKB
<br>
**Building the UniProt database**
We downloaded all the protein sequences (for [Bacteria](http://www.uniprot.org/uniprot/?query=taxonomy:2), [Archaea]( http://www.uniprot.org/uniprot/?query=taxonomy:2157) and [Viruses]( http://www.uniprot.org/uniprot/?query=taxonomy:10239)) from UniProtKB, which is non-redundant.

##Choosing the search algorithm
<br>
Due to the large size of the database and the large number of sequences, BLAST proved/resulted to be too slow and computationally expensive.
Thus we tested BLAST and three alternative algorithms, [RAPSearch2 (v1.02)](http://omics.informatics.indiana.edu/mg/RAPSearch2/), [LAMBDA (v0.9.4)](https://seqan.github.io/lambda/) and [DIAMOND (v0.7.12)](https://github.com/bbuchfink/diamond), on a single file of 10K sequences.
We compared the results, and based on the number of hits (recruited) (and number of best-hits shared with blast) we decided to use the LAMBDA algorithm.

[Scripts]()

[Results]()

<br> <br> <br>
<div id='BLAST/LAMBDA search vs NCBI nr database'/>
#BLAST/LAMBDA search/alignment vs NCBI nr database

