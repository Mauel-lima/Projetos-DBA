Delimiter &
CREATE FUNCTION fn_acento(vMsg varchar (100))
RETURNS VARCHAR (100) deterministic
BEGIN
	SET vMsg = REPLACE (vMsg,"ç","c"),
		vMsg = REPLACE (vMsg,"á","a"),
		vMsg = REPLACE (vMsg,"é","e"),
		vMsg = REPLACE (vMsg,"í","i"),
		vMsg = REPLACE (vMsg,"ú","u");
        RETURN vMsg;
END &
Delimiter ;

SELECT fn_acento("açaí é bom e único") as msg;
