CREATE OR REPLACE FUNCTION creer_date(mois_arg INT, annee_arg INT) RETURNS VOID AS $$
DECLARE
    max_jours INT := EXTRACT(DAY FROM (DATE_TRUNC('MONTH', MAKE_DATE(annee_arg, mois_arg, 1)) + INTERVAL '1 MONTH - 1 day'));
BEGIN
    FOR jour IN 1..max_jours LOOP
        INSERT INTO Dates(dates)
        VALUES (TO_CHAR(DATE_TRUNC('MONTH', MAKE_DATE(annee_arg, mois_arg, jour)), 'YYYY-MM-DD'));
    END LOOP;
END;
$$ LANGUAGE plpgsql;
