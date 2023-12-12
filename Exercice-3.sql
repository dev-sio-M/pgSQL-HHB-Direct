CREATE OR REPLACE FUNCTION creer_id_internet(
    nom_client_param VARCHAR(50),
    prenom_client_param VARCHAR(50)
) RETURNS TABLE (
    id_internet VARCHAR(50),
    mdp_internet VARCHAR(50)
) AS $$
DECLARE
    count_clients INTEGER;
BEGIN
    SELECT COUNT(*) INTO count_clients FROM Client c WHERE c.nom_client = nom_client_param AND c.prenom_client = prenom_client_param;

    id_internet := INITCAP(SUBSTRING(prenom_client_param, 1, 1)) || LOWER(nom_client_param) || COALESCE(count_clients + 1, '');
    mdp_internet := id_internet;

    RETURN QUERY SELECT id_internet, mdp_internet;
END;
$$ LANGUAGE plpgsql;
