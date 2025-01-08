USE `digicheese`;

#
# Table structure for table 'table_de_faits'
#

DROP TABLE IF EXISTS `table_de_faits`;

CREATE TABLE table_de_faits AS
SELECT 
    t_entcde.codcde, 
    t_entcde.datcde, 
    t_entcde.codcli, 
    t_entcde.timbrecli, 
    t_entcde.timbrecde,
    t_entcde.cheqcli,
    t_dtlcode.codobj, 
    t_dtlcode.qteObj AS "qteObj"
FROM 
    t_entcde
INNER JOIN 
    t_dtlcode
ON 
    t_entcde.codcde = t_dtlcode.codcde;