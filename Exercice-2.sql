CREATE OR REPLACE FUNCTION nb_operation_compte_mois(
    mois INT,
    annee INT,
    numero_compte INT,
    type_compte INT
) RETURNS INT AS $$
DECLARE
    nombre_operations INT;
BEGIN
    SELECT COUNT(*)
    INTO nombre_operations
    FROM Operation
    WHERE EXTRACT(MONTH FROM dates::DATE) = mois
    AND EXTRACT(YEAR FROM dates::DATE) = annee
    AND (num_compte = CONCAT(numero_compte, '_', type_compte)
         OR num_compte_1 = CONCAT(numero_compte, '_', type_compte));

    RETURN nombre_operations;
END;
$$ LANGUAGE plpgsql;
