
CREATE PROCEDURE [dbo].[PROC_TG_USUARIO_INSERTAR]
	@USUARI_T_CORREO		VARCHAR(100),
	@USUARI_T_NOMBRE		VARCHAR(100),
	@USUARI_T_CONTRA		VARCHAR(50),
	@GENERO_N_CODIGO		INT,
	@USUARI_T_FECNAC		VARCHAR(8),
	@PAROUT_T_FILAFE		INT OUTPUT
AS
BEGIN TRY
	INSERT INTO TG_USUARIO 
	(
	USUARI_T_CORREO,
	USUARI_T_NOMBRE,
	USUARI_T_CONTRA,
	GENERO_N_CODIGO,
	USUARI_T_FECNAC
	)
	VALUES
	(
	@USUARI_T_CORREO,
	@USUARI_T_NOMBRE,
	@USUARI_T_CONTRA,
	@GENERO_N_CODIGO,
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
GO
--==============================================================================

CREATE PROCEDURE [dbo].[PROC_TG_TEST_LISTAR]
(
@TEST_N_CODIGO INT
)
AS
BEGIN
	SELECT 
	TEST.TEST_N_CODIGO,
	TEST.TEST_T_DESCRI,
	SITUAC.SITUAC_N_CODIGO,
	SITUAC.SITUAC_T_DESCRI,
	SECCIO.SECCIO_N_CODIGO,
	SECCIO.SECCIO_T_DESCRI,
	RESPUE.RESPUE_N_CODIGO,
	RESPUE.RESPUE_T_DESCRI,
	SITRES.SITRES_N_CODIGO
	FROM		TG_TEST					TEST
	INNER JOIN	TG_TEST_SITUACION		TESSIT	ON	TEST.TEST_N_CODIGO		=	TESSIT.TEST_N_CODIGO	AND	TESSIT.TESSIT_F_ACTIVO	=	1
	INNER JOIN	TG_SITUACION			SITUAC	ON	TESSIT.SITUAC_N_CODIGO	=	SITUAC.SITUAC_N_CODIGO	AND	SITUAC.SITUAC_F_ACTIVO	=	1
	INNER JOIN	TG_SITUACION_RESPUESTA	SITRES	ON	SITUAC.SITUAC_N_CODIGO	=	SITRES.SITUAC_N_CODIGO	AND	SITRES.SITRES_F_ACTIVO	=	1
	INNER JOIN	TG_RESPUESTA			RESPUE	ON	SITRES.RESPUE_N_CODIGO	=	RESPUE.RESPUE_N_CODIGO	AND	RESPUE.RESPUE_F_ACTIVO	=	1
	INNER JOIN	TG_SECCION				SECCIO	ON	RESPUE.SECCIO_N_CODIGO	=	SECCIO.SECCIO_N_CODIGO	AND	SECCIO.SECCIO_F_ACTIVO	=	1
	WHERE
	TEST.TEST_N_CODIGO = @TEST_N_CODIGO
	AND	TEST.TEST_F_ACTIVO = 1
	ORDER BY SITRES.SITRES_N_CODIGO ASC
END
GO

--====================================================================
CREATE FUNCTION [dbo].[FN_REMOVETILDES] ( @Cadena VARCHAR(100) )
    RETURNS VARCHAR(100)
AS 
BEGIN
    RETURN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Cadena, '�', 'a'), '�','e'), '�', 'i'), '�', 'o'), '�','u'), '�', 'A'), '�', 'E'), '�', 'I'), '�', 'O'), '�', 'U')  
END
GO
--====================================================================

CREATE PROCEDURE [dbo].PROC_TG_USUARIO_LOGIN
@USUARI_T_CORREO VARCHAR(300)
AS
BEGIN
	SELECT
	USUARI_N_CODIGO,
	USUARI_T_NOMBRE,
	USUARI_T_CORREO,
	USUARI_T_CONTRA,
	GENERO_N_CODIGO,
	USUARI_N_TESTRE
	FROM	TG_USUARIO
	WHERE	UPPER(dbo.FN_REMOVETILDES(USUARI_T_CORREO)) = UPPER(dbo.FN_REMOVETILDES(@USUARI_T_CORREO))
END
GO

--=====================================================================

CREATE PROCEDURE [dbo].[PROC_TG_SITUACION_RESPUESTA_PUNTAJE_INSERTAR]
	@TEST_N_CODIGO			INT,
	@USUARI_N_CODIGO		INT,
	@SITRES_N_CODIGO		INT,
	@SIREPU_D_PUNTAJ		DECIMAL(18,2),
	@PAROUT_T_FILAFE		INT OUTPUT
AS
BEGIN TRY
	INSERT INTO TG_SITUACION_RESPUESTA_PUNTAJE 
	(
	TEST_N_CODIGO,
	USUARI_N_CODIGO,
	SITRES_N_CODIGO,
	SIREPU_D_PUNTAJ
	)
	VALUES
	(
	@TEST_N_CODIGO,
	@USUARI_N_CODIGO,
	@SITRES_N_CODIGO,
	@SIREPU_D_PUNTAJ
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
GO

--===================================================

CREATE PROCEDURE TG_DIAGNOSTICO_LISTAR (
@DIAGNO_N_CODIGO INT
)
AS
BEGIN
	SELECT
	DIAGNO.DIAGNO_N_COGPUN,
	DIAGNO.DIAGNO_N_FISPUN,
	DIAGNO.DIAGNO_N_CONPUN,
	DIAGNO.DIAGNO_N_TOTPUN,
	PUNCOG.PUNCOG_T_DESCRI,
	PUNFIS.PUNFIS_T_DESCRI,
	PUNCON.PUNCON_T_DESCRI,
	PUNDIR.PUNDIR_T_DESCRI
	FROM
	TG_DIAGNOSTICO							DIAGNO
	INNER JOIN TG_PUNTUACION_COGNITIVO		PUNCOG	ON	PUNCOG.PUNCOG_N_CODIGO	=	DIAGNO.PUNCOG_N_CODIGO	AND	PUNCOG.PUNCOG_F_ACTIVO	=	1
	INNER JOIN TG_PUNTUACION_FISIOLOGICO	PUNFIS	ON	PUNFIS.PUNFIS_N_CODIGO	=	DIAGNO.PUNFIS_N_CODIGO	AND	PUNFIS.PUNFIS_F_ACTIVO	=	1
	INNER JOIN TG_PUNTUACION_CONDUCTUAL		PUNCON	ON	PUNCON.PUNCON_N_CODIGO	=	DIAGNO.PUNCON_N_CODIGO	AND	PUNCON.PUNCON_F_ACTIVO	=	1
	INNER JOIN TG_PUNTUACION_DIRECTA		PUNDIR	ON	PUNDIR.PUNDIR_N_CODIGO	=	DIAGNO.PUNDIR_N_CODIGO	AND	PUNDIR.PUNDIR_F_ACTIVO	=	1
	WHERE
	DIAGNO.DIAGNO_N_CODIGO = @DIAGNO_N_CODIGO AND DIAGNO.DIAGNO_F_ACTIVO = 1
END
GO

--===================================================
CREATE PROCEDURE [dbo].PROC_TG_DIAGNOSTICAR
@USUARI_N_CODIGO INT,
@TEST_N_CODIGO INT
AS
BEGIN
	--CALCULO DE LOS PUNTAJES EN CADA SECCION Y EL PUNTAJE TOTAL
	DECLARE
	@GENERO INT = (SELECT GENERO_N_CODIGO FROM TG_USUARIO WHERE USUARI_N_CODIGO = @USUARI_N_CODIGO),
	@PUNTAJE_COGNITIVO DECIMAL(18,2)		= ISNULL((	SELECT 
														SUM(SIREPU_D_PUNTAJ) 
														FROM		TG_SITUACION_RESPUESTA_PUNTAJE	SIREPU 
														INNER JOIN	TG_SITUACION_RESPUESTA			SITRES	ON	SIREPU.SITRES_N_CODIGO	=	SITRES.SITRES_N_CODIGO	AND	SITRES.SITRES_F_ACTIVO	=	1
														INNER JOIN  TG_RESPUESTA					RESPUE	ON	SITRES.RESPUE_N_CODIGO	=	RESPUE.RESPUE_N_CODIGO	AND	RESPUE.RESPUE_F_ACTIVO	=	1
														WHERE SIREPU.USUARI_N_CODIGO = @USUARI_N_CODIGO AND SIREPU.TEST_N_CODIGO = @TEST_N_CODIGO AND RESPUE.SECCIO_N_CODIGO = 1),0),
	@PUNTAJE_FISIOLOGICO DECIMAL(18,2)		= ISNULL((	SELECT 
														SUM(SIREPU_D_PUNTAJ) 
														FROM		TG_SITUACION_RESPUESTA_PUNTAJE	SIREPU 
														INNER JOIN	TG_SITUACION_RESPUESTA			SITRES	ON	SIREPU.SITRES_N_CODIGO	=	SITRES.SITRES_N_CODIGO	AND	SITRES.SITRES_F_ACTIVO	=	1
														INNER JOIN  TG_RESPUESTA					RESPUE	ON	SITRES.RESPUE_N_CODIGO	=	RESPUE.RESPUE_N_CODIGO	AND	RESPUE.RESPUE_F_ACTIVO	=	1
														WHERE SIREPU.USUARI_N_CODIGO = @USUARI_N_CODIGO AND SIREPU.TEST_N_CODIGO = @TEST_N_CODIGO AND RESPUE.SECCIO_N_CODIGO = 2),0),
	@PUNTAJE_CONDUCTUAL DECIMAL(18,2)		= ISNULL((	SELECT 
														SUM(SIREPU_D_PUNTAJ) 
														FROM		TG_SITUACION_RESPUESTA_PUNTAJE	SIREPU 
														INNER JOIN	TG_SITUACION_RESPUESTA			SITRES	ON	SIREPU.SITRES_N_CODIGO	=	SITRES.SITRES_N_CODIGO	AND	SITRES.SITRES_F_ACTIVO	=	1
														INNER JOIN  TG_RESPUESTA					RESPUE	ON	SITRES.RESPUE_N_CODIGO	=	RESPUE.RESPUE_N_CODIGO	AND	RESPUE.RESPUE_F_ACTIVO	=	1
														WHERE SIREPU.USUARI_N_CODIGO = @USUARI_N_CODIGO AND SIREPU.TEST_N_CODIGO = @TEST_N_CODIGO AND RESPUE.SECCIO_N_CODIGO = 3),0)
	DECLARE
	@DIAGNO_N_COGPUN DECIMAL(18,2) = @PUNTAJE_COGNITIVO,
	@DIAGNO_N_FISPUN DECIMAL(18,2) = @PUNTAJE_FISIOLOGICO,
	@DIAGNO_N_CONPUN DECIMAL(18,2) = @PUNTAJE_CONDUCTUAL

	IF @PUNTAJE_FISIOLOGICO > 0
		SET @PUNTAJE_FISIOLOGICO = ROUND(@PUNTAJE_FISIOLOGICO / 2, 2)

	DECLARE
	@DIAGNO_N_TOTPUN DECIMAL(18,2) = @PUNTAJE_COGNITIVO + @PUNTAJE_FISIOLOGICO + @PUNTAJE_CONDUCTUAL

	--OBTENER EL DIAGNOSTICO EN BASE AL PUNTAJE CALCULADO
	DECLARE
	@PUNDIR_N_CODIGO VARCHAR(500) = (SELECT PUNDIR_N_CODIGO FROM TG_PUNTUACION_DIRECTA WHERE GENERO_N_CODIGO = @GENERO AND (PUNDIR_N_MINPUN <= @DIAGNO_N_TOTPUN AND PUNDIR_N_MAXPUN >= @DIAGNO_N_TOTPUN)),
	@PUNCOG_N_CODIGO VARCHAR(500) = (SELECT PUNCOG_N_CODIGO FROM TG_PUNTUACION_COGNITIVO WHERE GENERO_N_CODIGO = @GENERO AND (PUNCOG_N_MINPUN <= @PUNTAJE_COGNITIVO AND PUNCOG_N_MAXPUN >= @PUNTAJE_COGNITIVO)),
	@PUNFIS_N_CODIGO VARCHAR(500) = (SELECT PUNFIS_N_CODIGO FROM TG_PUNTUACION_FISIOLOGICO WHERE GENERO_N_CODIGO = @GENERO AND (PUNFIS_N_MINPUN <= @PUNTAJE_FISIOLOGICO AND PUNFIS_N_MAXPUN >= @PUNTAJE_FISIOLOGICO)),
	@PUNCON_N_CODIGO VARCHAR(500) = (SELECT PUNCON_N_CODIGO FROM TG_PUNTUACION_CONDUCTUAL WHERE GENERO_N_CODIGO = @GENERO AND (PUNCON_N_MINPUN <= @PUNTAJE_CONDUCTUAL AND PUNCON_N_MAXPUN >= @PUNTAJE_CONDUCTUAL))

	INSERT INTO TG_DIAGNOSTICO
	(
	TEST_N_CODIGO,
	USUARI_N_CODIGO,
	DIAGNO_N_COGPUN,
	DIAGNO_N_FISPUN,
	DIAGNO_N_CONPUN,
	DIAGNO_N_TOTPUN,
	PUNCOG_N_CODIGO,
	PUNFIS_N_CODIGO,
	PUNCON_N_CODIGO,
	PUNDIR_N_CODIGO
	)
	VALUES
	(
	@TEST_N_CODIGO,
	@USUARI_N_CODIGO,
	@DIAGNO_N_COGPUN,
	@DIAGNO_N_FISPUN,
	@DIAGNO_N_CONPUN,
	@DIAGNO_N_TOTPUN,
	@PUNCOG_N_CODIGO,
	@PUNFIS_N_CODIGO,
	@PUNCON_N_CODIGO,
	@PUNDIR_N_CODIGO
	)

	DECLARE @DIAGNO_N_CODIGO INT = SCOPE_IDENTITY()

	EXEC TG_DIAGNOSTICO_LISTAR @DIAGNO_N_CODIGO
END
GO
