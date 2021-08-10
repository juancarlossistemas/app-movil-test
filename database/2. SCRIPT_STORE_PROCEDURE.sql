
CREATE PROCEDURE [dbo].[PROC_TG_USUARIO_INSERTAR]
	@USUARI_T_CORREO		VARCHAR(100),
	@USUARI_T_NOMBRE		VARCHAR(100),
	@USUARI_T_CONTRA		VARCHAR(50),
	@USUARI_N_GENERO		INT,
	@USUARI_T_FECNAC		VARCHAR(8),
	@PAROUT_T_FILAFE		INT OUTPUT
AS
BEGIN TRY
	INSERT INTO TG_USUARIO 
	(
	USUARI_T_CORREO,
	USUARI_T_NOMBRE,
	USUARI_T_CONTRA,
	USUARI_N_GENERO,
	USUARI_T_FECNAC
	)
	VALUES
	(
	@USUARI_T_CORREO,
	@USUARI_T_NOMBRE,
	@USUARI_T_CONTRA,
	@USUARI_N_GENERO,
	@USUARI_T_FECNAC
	)

	SET @PAROUT_T_FILAFE = @@ROWCOUNT
END TRY
BEGIN CATCH
PRINT 'Error Number: ' + Convert(varchar(MAX),ERROR_NUMBER())
PRINT 'Error Severity: ' + Convert(varchar(MAX), ERROR_SEVERITY())
PRINT 'Error State: ' + Convert(varchar(MAX), ERROR_STATE())
PRINT 'Error Procedure: ' + Convert(varchar(MAX), ERROR_PROCEDURE())
PRINT 'Error Line: ' + Convert(varchar(MAX), ERROR_LINE())
PRINT 'Error Message: ' + Convert(varchar(MAX), ERROR_MESSAGE())
SET @PAROUT_T_FILAFE = 0
END CATCH

--==============================================================================
