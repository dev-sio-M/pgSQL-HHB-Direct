CREATE OR REPLACE FUNCTION nb_operation_compte_mois(
    mois_arg INT,
    annee_arg INT,
    numero_compte_arg INT,
    type_compte_arg INT
) RETURNS INT AS $$
DECLARE
    nombre_operations INT;
BEGIN
    SELECT COUNT(*)
    INTO nombre_operations
    FROM Operation
    WHERE EXTRACT(MONTH FROM dates::DATE) = mois_arg
    AND EXTRACT(YEAR FROM dates::DATE) = annee_arg
    AND (num_compte = CONCAT(numero_compte_arg, '_', type_compte_arg)
         OR num_compte_1 = CONCAT(numero_compte_arg, '_', type_compte_arg));

    RETURN nombre_operations;
END;
$$ LANGUAGE plpgsql;
