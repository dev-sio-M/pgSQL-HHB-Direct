CREATE OR REPLACE FUNCTION creer_user_client() RETURNS INT AS $$
DECLARE
    client_record RECORD;
    user_count INT := 0;
BEGIN
    FOR client_record IN SELECT num_client, identifiant_internet, mdp_internet FROM Client LOOP
        IF NOT EXISTS (
            SELECT 1 FROM pg_roles WHERE rolname = client_record.identifiant_internet::varchar
        ) THEN
            EXECUTE format(
                'CREATE ROLE %I WITH LOGIN PASSWORD %L',
                client_record.identifiant_internet, client_record.mdp_internet
            );
            user_count := user_count + 1;
        END IF;
    END LOOP;

    RETURN user_count;
END;
$$ LANGUAGE plpgsql;
