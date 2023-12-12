CREATE OR REPLACE FUNCTION creer_id_internet(
    nom_client VARCHAR(50),
    prenom_client VARCHAR(50)
) RETURNS TABLE (
    id_internet VARCHAR(50),
    mdp_internet VARCHAR(50)
) AS $$
DECLARE
    count_clients INTEGER;
BEGIN
    SELECT COUNT(*) INTO count_clients FROM Client c WHERE c.nom_client = nom_client AND c.prenom_client = prenom_client;

    id_internet := INITCAP(SUBSTRING(prenom_client, 1, 1)) || LOWER(nom_client) || COALESCE(count_clients + 1, '');
    mdp_internet := id_internet;

    RETURN QUERY SELECT id_internet, mdp_internet;
END;
$$ LANGUAGE plpgsql;
