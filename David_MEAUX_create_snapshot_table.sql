USE `digicheese`;
SET @table_name = CONCAT("snapshot_", CAST(FLOOR(UTC_TIMESTAMP() +0) AS CHAR));

SET @d = CONCAT("DROP TABLE IF EXISTS `", @table_name, "`;");

PREPARE drop_stmt FROM @d;
EXECUTE drop_stmt;
DEALLOCATE PREPARE drop_stmt;

SET @c = CONCAT("CREATE TABLE ", @table_name, " AS ",
"
SELECT
    dtl.`codcde`,
    dtl.`codobj`,
    dtl.`qte`,
    dtl.`Colis`,
    dtl.`Commentaire`,
    ent.`datcde`,
    ent.`codcli`,
    ent.`timbrecli`,
    ent.`timbrecde`,
    ent.`Nbcolis`,
    ent.`cheqcli`,
    ent.`idcondit`,
    ent.`cdeComt`,
    ent.`barchive`,
    ent.`bstock`,
    cli.`genrecli`,
    cli.`nomcli`,
    cli.`prenomcli`,
    cli.`adresse1cli`,
    cli.`adresse2cli`,
    cli.`adresse3cli`,
    cli.`cpcli`,
    cli.`villecli`,
    cli.`telcli`,
    cli.`emailcli`,
    cli.`portcli`,
    cli.`newsletter`  
FROM `T_entcde` ent
INNER JOIN `T_dtlcode` dtl
    ON ent.codcde = dtl.codcde
INNER JOIN `T_client` cli
    ON ent.codcli = cli.codcli
;
");

PREPARE snapshot_stmt FROM @c;
EXECUTE snapshot_stmt;
DEALLOCATE PREPARE snapshot_stmt;
