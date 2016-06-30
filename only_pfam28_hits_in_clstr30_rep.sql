CREATE VIEW only_pfam28_hits_in_clstr30_rep AS
SELECT a.seq_id
FROM tara_osd_gos_only_pfam28_hits a 
INNER JOIN cluster30_from90 b ON a.seq_id = b.ids
WHERE b.rep_seq = '1'