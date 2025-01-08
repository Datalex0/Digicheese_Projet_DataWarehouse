DROP TABLE IF EXISTS t_faits;
CREATE TABLE t_faits AS
SELECT 
    t_dtlcode.codcde,
    t_dtlcode.codobj,
    t_dtlcode.qte,
    t_dtlcode.Colis,
    t_dtlcode.Commentaire,
    t_entcde.datcde,
    t_entcde.codcli,
    t_entcde.timbrecli,
    t_entcde.timbrecde,
    t_entcde.Nbcolis,
    t_entcde.cheqcli,
    t_entcde.idcondit,
    t_entcde.cdeComt,
    t_entcde.barchive,
    t_entcde.bstock
FROM t_dtlcode
INNER JOIN t_entcde ON t_dtlcode.codcde = t_entcde.codcde;
