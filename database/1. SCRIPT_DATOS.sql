CREATE DATABASE SISTEST
GO

USE SISTEST
GO

CREATE TABLE TG_GENERO (
GENERO_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
GENERO_T_DESCRI VARCHAR(50),
GENERO_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_USUARIO (
USUARI_N_CODIGO	INT PRIMARY KEY IDENTITY(1,1),
USUARI_T_CORREO	VARCHAR(100),
USUARI_T_NOMBRE	VARCHAR(100),
USUARI_T_CONTRA	VARCHAR(50),
GENERO_N_CODIGO	INT FOREIGN KEY REFERENCES TG_GENERO (GENERO_N_CODIGO),
USUARI_T_FECNAC	VARCHAR(8),
USUARI_N_TESTRE INT DEFAULT 1,
USUARI_F_ACTIVO	INT	DEFAULT 1
)
GO

CREATE TABLE TG_TEST (
TEST_N_CODIGO	INT PRIMARY KEY IDENTITY(1,1),
TEST_T_DESCRI	VARCHAR(50),
TEST_F_ACTIVO	INT	DEFAULT 1
)
GO

CREATE TABLE TG_SITUACION (
SITUAC_N_CODIGO	INT PRIMARY KEY IDENTITY(1,1),
SITUAC_T_DESCRI	NVARCHAR(500),
SITUAC_F_ACTIVO	INT	DEFAULT 1
)
GO

CREATE TABLE TG_TEST_SITUACION (
TESSIT_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
TEST_N_CODIGO	INT FOREIGN KEY REFERENCES TG_TEST (TEST_N_CODIGO),
SITUAC_N_CODIGO	INT FOREIGN KEY REFERENCES TG_SITUACION (SITUAC_N_CODIGO),
TESSIT_F_ACTIVO INT	DEFAULT 1
)

CREATE TABLE TG_SECCION (
SECCIO_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
SECCIO_T_DESCRI VARCHAR(50),
SECCIO_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_RESPUESTA (
RESPUE_N_CODIGO	INT PRIMARY KEY IDENTITY(1,1),
RESPUE_T_DESCRI	NVARCHAR(500),
SECCIO_N_CODIGO INT FOREIGN KEY REFERENCES TG_SECCION (SECCIO_N_CODIGO),
RESPUE_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_SITUACION_RESPUESTA (
SITRES_N_CODIGO	INT PRIMARY KEY IDENTITY(1,1),
SITUAC_N_CODIGO	INT FOREIGN KEY REFERENCES TG_SITUACION (SITUAC_N_CODIGO),
RESPUE_N_CODIGO INT FOREIGN KEY REFERENCES TG_RESPUESTA (RESPUE_N_CODIGO),
SITRES_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_SITUACION_RESPUESTA_PUNTAJE (
SIREPU_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
TEST_N_CODIGO	INT FOREIGN KEY REFERENCES TG_TEST (TEST_N_CODIGO),
USUARI_N_CODIGO INT FOREIGN KEY REFERENCES TG_USUARIO (USUARI_N_CODIGO),
SITRES_N_CODIGO INT FOREIGN KEY REFERENCES TG_SITUACION_RESPUESTA (SITRES_N_CODIGO),
SIREPU_D_PUNTAJ DECIMAL(18,2),
SIREPU_N_FECREG VARCHAR(8) DEFAULT CONVERT(VARCHAR, GETDATE(), 112),
SIREPU_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_PUNTUACION_DIRECTA (
PUNDIR_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
GENERO_N_CODIGO	INT FOREIGN KEY REFERENCES TG_GENERO (GENERO_N_CODIGO),
PUNDIR_T_DESCRI VARCHAR(200),
PUNDIR_N_MINPUN INT,
PUNDIR_N_MAXPUN INT,
PUNDIR_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_PUNTUACION_COGNITIVO (
PUNCOG_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
GENERO_N_CODIGO	INT FOREIGN KEY REFERENCES TG_GENERO (GENERO_N_CODIGO),
PUNCOG_T_DESCRI VARCHAR(200),
PUNCOG_N_MINPUN INT,
PUNCOG_N_MAXPUN INT,
PUNCOG_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_PUNTUACION_FISIOLOGICO (
PUNFIS_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
GENERO_N_CODIGO	INT FOREIGN KEY REFERENCES TG_GENERO (GENERO_N_CODIGO),
PUNFIS_T_DESCRI VARCHAR(200),
PUNFIS_N_MINPUN INT,
PUNFIS_N_MAXPUN INT,
PUNFIS_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_PUNTUACION_CONDUCTUAL (
PUNCON_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
GENERO_N_CODIGO	INT FOREIGN KEY REFERENCES TG_GENERO (GENERO_N_CODIGO),
PUNCON_T_DESCRI VARCHAR(200),
PUNCON_N_MINPUN INT,
PUNCON_N_MAXPUN INT,
PUNCON_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_NIVEL_ANSIEDAD (
NIVANS_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
NIVANS_T_DESCRI VARCHAR(50),
NIVANS_F_ACTIVO INT DEFAULT 1
)
GO

SET IDENTITY_INSERT TG_NIVEL_ANSIEDAD ON
INSERT INTO TG_NIVEL_ANSIEDAD (NIVANS_N_CODIGO, NIVANS_T_DESCRI) VALUES (1, 'AUSENCIA DE ANSIEDAD')
INSERT INTO TG_NIVEL_ANSIEDAD (NIVANS_N_CODIGO, NIVANS_T_DESCRI) VALUES (2, 'MODERADA')
INSERT INTO TG_NIVEL_ANSIEDAD (NIVANS_N_CODIGO, NIVANS_T_DESCRI) VALUES (3, 'SEVERA')
INSERT INTO TG_NIVEL_ANSIEDAD (NIVANS_N_CODIGO, NIVANS_T_DESCRI) VALUES (4, 'EXTREMA')
SET IDENTITY_INSERT TG_NIVEL_ANSIEDAD OFF

CREATE TABLE TG_SESION (
SESION_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
SESION_T_DESCRI VARCHAR(50),
SESION_F_ACTIVO INT DEFAULT 1
)
GO

SET IDENTITY_INSERT TG_SESION ON
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (1, 'SESIÓN 1')
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (2, 'SESIÓN 2')
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (3, 'SESIÓN 3')
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (4, 'SESIÓN 4')
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (5, 'SESIÓN 5')
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (6, 'SESIÓN 6')
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (7, 'SESIÓN 7')
INSERT INTO TG_SESION (SESION_N_CODIGO, SESION_T_DESCRI) VALUES (8, 'SESIÓN 8')
SET IDENTITY_INSERT TG_SESION OFF
GO

CREATE TABLE TG_SEMANA (
SEMANA_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
SEMANA_T_DESCRI VARCHAR(50),
SEMANA_N_CANDIA INT,
SEMANA_F_ACTIVO INT DEFAULT 1
)
GO

SET IDENTITY_INSERT TG_SEMANA ON
INSERT INTO TG_SEMANA (SEMANA_N_CODIGO, SEMANA_T_DESCRI, SEMANA_N_CANDIA) VALUES (1, 'SEMANA 1', 0)
INSERT INTO TG_SEMANA (SEMANA_N_CODIGO, SEMANA_T_DESCRI, SEMANA_N_CANDIA) VALUES (2, 'SEMANA 2', 7)
INSERT INTO TG_SEMANA (SEMANA_N_CODIGO, SEMANA_T_DESCRI, SEMANA_N_CANDIA) VALUES (3, 'SEMANA 3', 14)
INSERT INTO TG_SEMANA (SEMANA_N_CODIGO, SEMANA_T_DESCRI, SEMANA_N_CANDIA) VALUES (4, 'SEMANA 4', 21)
SET IDENTITY_INSERT TG_SEMANA OFF
GO

CREATE TABLE TG_TECNICA (
TECNIC_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
TECNIC_T_TITULO VARCHAR(100),
TECNIC_F_ACTIVO INT DEFAULT 1
)
GO

SET IDENTITY_INSERT TG_TECNICA ON
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (1, 'TÉCNICA DE BIBLIOTERAPIA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (2, 'TÉCNICA DE RELAJACIÓN MUSCULAR PROFUNDA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (3, 'TÉCNICA DE RESPIRACIÓN PROFUNDA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (4, 'ENTRENAMIENTO AUTÓGENO DE SCHULTZ')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (5, 'RELAJACIÓN PROGRESIVA DE JACOBSON')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (6, 'PARADA DEL PENSAMIENTO')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (7, 'REESTRUCTURACIÓN COGNITIVA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (8, 'AUTODIALOGO')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (9, 'TÉCNICA DE LA VISUALIZACIÓN')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (10, 'RESPIRACIÓN DIAFRAGMÁTICA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (11, 'TÉCNICA DE MINDFULNESS')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (12, 'TÉCNICA DE IMÁGINACIÓN GUIADA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (13, 'MUSICOTERAPIA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (14, 'EJERCICIO FÍSICO')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (15, 'YOGA')
INSERT INTO TG_TECNICA (TECNIC_N_CODIGO, TECNIC_T_TITULO) VALUES  (16, 'TÉCNICA DE EXPOSICIÓN COGNITIVA')
SET IDENTITY_INSERT TG_TECNICA OFF
GO

CREATE TABLE TG_TIPO_CONTENIDO (
TIPCON_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
TIPCON_T_DESCRI VARCHAR(100),
TIPCON_F_ACTIVO INT DEFAULT 1
)
GO

SET IDENTITY_INSERT TG_TIPO_CONTENIDO ON
INSERT INTO TG_TIPO_CONTENIDO (TIPCON_N_CODIGO, TIPCON_T_DESCRI) VALUES (1, 'TEXTO')
INSERT INTO TG_TIPO_CONTENIDO (TIPCON_N_CODIGO, TIPCON_T_DESCRI) VALUES (2, 'IMAGEN')
INSERT INTO TG_TIPO_CONTENIDO (TIPCON_N_CODIGO, TIPCON_T_DESCRI) VALUES (3, 'VIDEO')
SET IDENTITY_INSERT TG_TIPO_CONTENIDO OFF
GO

CREATE TABLE TG_TECNICA_DETALLE (
TECDET_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
TECNIC_N_CODIGO INT FOREIGN KEY REFERENCES TG_TECNICA (TECNIC_N_CODIGO),
TIPCON_N_CODIGO INT FOREIGN KEY REFERENCES TG_TIPO_CONTENIDO (TIPCON_N_CODIGO),
TECDET_T_CONTEN VARCHAR(4000),
TECDET_N_ORDEN	INT,
TECDET_F_ACTIVO INT DEFAULT 1
)
GO

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (1, 1, 1, 'La biblioterapia es la utilización de la literatura para apoyar a las personas a enfrentar sus distintos problemas emocionales, enfermedades mentales o cambios en sus vidas. (Ibáñez y Manzanera, 2012, p. 7)')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (1, 2, 1, 'Ventajas del uso de la biblioterapia: Ayudar a las personas a entenderse y conocerse mejor. (1) Contribuye a que se den cuenta de que no son los únicos que tienen un determinado problema, lo que hará disminuir su miedo a lo desconocido y el sentimiento de soledad. (2) Ayuda a aprender estrategias para afrontar sus problemas y así disminuir sus frustraciones y conflictos. (3) Promueve la independencia y la autoayuda, con lo que se consigue desarrollar un autoconcepto más positivo de uno mismo.')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 1, 1, '¡Recuerda! La mejor postura para practicar la relajación es cómodamente sentada, con la cabeza, los brazos y las piernas apoyados, en posición semitumbada, en una habitación tranquila, con luz indirecta y, sobre todo, realizando el entrenamiento sin prisas ni interrupciones. (Ibáñez y Manzanera, 2012, p. 7)')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 2, 1, '(A continuación, se muestra un protocolo de RMP completa para los 16 grupos musculares)')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 3, 1, '1.er Grupo: manos y antebrazos. Aprieta simultáneamente ambos puños. ˜ Nota la tensión en tus antebrazos y manos, céntrate en esas sensaciones. Esto es tensión. Suelta las manos, libera la tensión, céntrate en las sensaciones que invaden tus antebrazos y cuán diferentes son respecto a la tensión.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 4, 1, '2.◦ Grupo: bíceps. Lleva las manos a los hombros y aprieta los bíceps contra los antebrazos, localiza la tensión en los bíceps. Céntrate en ella, nota la tensión. Suelta los bíceps, y deja que las manos vuelvan a la posición inicial. Nota la diferencia de sensaciones en tus bíceps.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 5, 1, '3.er Grupo: tríceps. Estira ambos brazos al frente de forma que se queden paralelos entre ellos y con respecto al suelo, tensa la parte posterior de los brazos, los tríceps. Nota los puntos de tensión. Fíjate en ellos. Suelta los tríceps, deja caer los brazos y analiza lo que notas. Nota la diferencia.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 6, 1, '4.◦ Grupo: hombros-trapecio. Eleva los hombros hacia arriba como si quisieras tocar las orejas. Mantén la tensión y nótala en tus hombros y trapecios. Focaliza tu atención en lo que notas. Suelta los hombros, déjalos caer. Elimina la tensión. Presta atención a lo que notas.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 7, 1, '5.◦ grupo: cuello I. Inclina la cabeza hacia delante como si quisieras tocar con la barbilla el pecho. Hazlo lentamente. Nota tensión en la parte de atrás del cuello. Nota la tensión. Vuelve lentamente a la posición de reposo. Céntrate en los cambios que estás notando en la parte posterior del cuello. Nota la distensión.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 8, 1, '6.◦ grupo: cuello II. Empuja, con la parte posterior de la cabeza y no con la nuca, el sofá hacia atrás. Nota la tensión en la parte frontal del cuello. Céntrate en ella y mantenla. Suelta lentamente, elimina la tensión y ve notando la diferencia.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 9, 1, '7.◦ grupo: frente. Sube las cejas hacia arriba hasta notar arrugas en la frente. Nota la tensión. Suelta tu frente y deja que las cejas reposen. Nota las sensaciones diferentes a la tensión que aparecen en tu frente. ')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 10, 1, '8.◦ grupo: ojos. Aprieta fuertemente los ojos hasta crear arrugas en los párpados. Nota la incomodidad y la tensión. Suelta los párpados y deja los ojos cerrados suavemente. Nota la diferencia. Lo que sientes ahora es diferente a la tensión.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 11, 1, '9.◦ grupo: labios y mejillas. Haz una sonrisa forzada sin que se vean los dientes. Localiza los puntos de tensión alrededor de tu boca. Céntrate en esa tensión. Suelta, elimina la sonrisa, y nota las sensaciones que aparecen.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 12, 1, '10.◦ grupo: pecho-espalda. Haz este ejercicio muy lentamente. Arquea el torso, de manera que tu pecho salga hacia delante y tus hombros y codos hacia atrás. Mantén esta postura notando la tensión en pecho y espalda. Vuelve muy lentamente a la posición original destensando. Y deja que tu espalda se apoye completamente en el sofá. Nota la diferencia.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 13, 1, '11.◦ grupo: abdominales I. Mete la zona del estómago hacia adentro. Nota la tensión. Suelta y deja que los músculos vuelvan a su posición original. Discrimina las sensaciones.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 14, 1, '12.◦ grupo: abdominales II. Saca la zona del estómago hacia fuera hasta notar tensión. Céntrate en la tensión. Suelta y observa los cambios que se producen. Discrimina las nuevas sensaciones.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 15, 1, '13.◦ grupo: muslos. Contrae ambos muslos simultáneamente. Nota las sensaciones de tensión que te producen. Suéltalos y analiza la diferencia.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 16, 1, '14.◦ grupo: gemelos. Apunta los pies hacia la cabeza notando la tensión de tus gemelos. Suelta. Observa las diferentes sensaciones.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 17, 1, '15.◦ grupo: pies. Lleva tus pies hacia abajo intentando formar una línea recta con tus piernas. Localiza la tensión en pies y gemelos. Suelta y sé consciente de las diferencias que notas.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (2, 18, 1, '¡recuerda! Con la práctica cada vez se necesitará menos tiempo para eliminar la tensión. Ya que se irán uniendo diferentes grupos musculares y se llegará finalmente a la relajación mental, donde directamente produciremos relajación en los músculos que detectemos con tensión.')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (3, 1, 1, 'La respiración profunda es un método de autocontrol potente. Produce efectos fisiológicamente tan beneficiosos como los que provoca la relajación. (Ibáñez y Manzanera, 2012, p. 7)')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (3, 2, 1, '*El entrenamiento es muy sencillo. La postura para el aprendizaje será cómodamente sentado*')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (3, 3, 1, 'Instrucciones: Se inspirará suave y lentamente por la nariz (3-4 s), se notará cómo se llenan los pulmones y cómo estómago y abdominales salen hacia fuera. Se mantiene el aire dentro (2-3 s) y espira muy lentamente por la boca (4-5 s) hasta eliminar completamente el aire de los pulmones. Se repite el ciclo 5 veces, descansando unos minutos, y realizando después 5 ciclos de inspiración-expiración más.')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (3, 4, 1, '¡importante! Se practica dos veces todos los días. Un momento excelente para practicar es justo después del entrenamiento en relajación. De hecho, los mejores resultados se conseguirán combinando ambos procedimientos.')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (4, 1, 1, 'El entrenamiento autógeno de Schultz trabaja sobre la base somática de la ansiedad generando un estado de relajación (Urra, 2014, p. 2).')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (4, 2, 1, 'Entrenamiento autógeno de Schultz 1:')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (4, 3, 1, 'Entrenamiento autógeno de Schultz 2:')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (5, 1, 1, 'La relajación progresiva de Jacobson trabaja sobre la base somática de la ansiedad generando un estado de relajación (Urra, 2014, p. 2).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (6, 1, 1, 'La parada del pensamiento es una técnica destinada a evitar o disminuir el efecto de aquellas cogniciones que potencialmente incitarían un desempeño poco eficiente (Urra, 2014, p. 2).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (7, 1, 1, 'La reestructuración cognitiva es una técnica destinada a evitar o disminuir el efecto de aquellas cogniciones que potencialmente incitarían un desempeño poco eficiente (Urra, 2014, p. 2).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (8, 1, 1, 'El auto diálogo alude a una técnica cognitiva de modificación conductual basada en el cambio de las verbalizaciones negativas por otras más útiles para mejorar el autocontrol, asimismo entre las diversas finalidades de auto diálogo se pueden señalar el control atencional, la creación de estados de ánimo, el aumento de la concentración, el aumento del rendimiento deportivo y la reducción de ansiedad (Urra, 2014, p. 2).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (9, 1, 1, 'La visualización ha sido uno de los contextos de entrenamiento mayormente utilizados para el aprendizaje y/o aplicación de estrategias de afrontamiento a la ansiedad (Urra, 2014, p. 2).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (10, 1, 1, 'La respiración es el único que puede controlarse voluntariamente para disminuir el nivel basal de activación y generar respuestas de relajación que facilitan el equilibrio emocional, asimismo es una de las técnicas de control respiratorio más utilizadas es la respiración diafragmática (Urra, 2014, p. 2).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (11, 1, 1, 'Engler, Srivastava, Sahim y Min LI (2019) señalaron que la meditación es una técnica de cuerpo y mente utilizado para inducir la relajación o reducir los síntomas de fatiga, depresión, ansiedad, fibromialgia, ira, hipertensión, reumatoide artritis, diabetes, tinnitus, insuficiencia cardíaca congestiva, dolor de espalda y muchas otras condiciones médicas crónicas (p. 13).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (12, 1, 1, 'Becerra, Reynoso, García y Ramírez (2106) señalaron que técnicas como la imaginación guiada, figuraba como la herramienta más eficaz para el manejo de ansiedad aun tratándose de un tratamiento no farmacológico (p.3).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (13, 1, 1, 'Monerris, Medina, Caparros, Aguas y Simón (2019) señalaron que la intervención musical es un recurso terapéutico que está siendo cada vez más utilizado como terapia complementaria, para promover relajación, confort emocional y espiritual, distracción, sensación de bienestar y alivio del dolor, así mismo la musicoterapia se ha mostrado eficaz, principalmente como forma de reducir la ansiedad (p. 2).')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (14, 1, 1, 'El ejercicio resulta eficaz, ya que la ansiedad se asocia a un aumento de la actividad simpática y del tono vagal y el ejercicio tiende a amortiguarlo mediante contracciones musculares, asimismo las terapias alternativas como el ejercicio son efectivas para controlar y reducir los síntomas (De Souza et al., 2015, p. 2).')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (14, 2, 1, 'Ejercicio físico – Estiramientos')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (14, 3, 1, 'Ejercicio físico – aeróbicos')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (14, 4, 1, 'Ejercicio físico – resistencia')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 1, 1, 'Engler, Srivastava, Sahim y Min LI (2019) señalaron que el yoga ha evolucionado en el ejercicio cuerpo-mente practicado a nivel mundial que es cada vez más reconocido tener beneficios para la salud en una variedad de condiciones clínicas y no clínicas con componentes de bienestar físico, mental, social y espiritual (p.14).')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 2, 1, 'Día 1:')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 3, 1, 'Día 2:')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 4, 1, 'Día 3:')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 5, 1, 'Día 4:')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 6, 1, 'Día 5:')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 7, 1, 'Día 6:')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (15, 8, 1, 'Día 7:')

INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (16, 1, 1, 'Leira y Navío (2010) afirmaron que la exposición cognitiva, es útil para descubrir los pensamientos irracionales que con frecuencia sustentan la ansiedad desadaptativa (p. 12). ')
INSERT INTO TG_TECNICA_DETALLE (TECNIC_N_CODIGO, TECDET_N_ORDEN, TIPCON_N_CODIGO, TECDET_T_CONTEN)
VALUES (16, 2, 1, 'Instrucciones: (1) Evalúe sus cinco preocupaciones fundamentales. (2) Póngalas en orden y asigne un valor puntuándolas de 0 a 100. (3) Empiece por la primera, la de menor puntuación. Realice un guion con las imágenes, las consecuencias temidas, los errores cognitivos, etc. (4) Relájese y manténgase al margen durante 20 min, tantas veces como sea necesario, hasta que no perciba ninguna tensión al imaginarlas. (5) Comience con la siguiente preocupación.')
GO

CREATE TABLE TG_TRATAMIENTO (
TRATAM_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
NIVANS_N_CODIGO INT FOREIGN KEY REFERENCES TG_NIVEL_ANSIEDAD (NIVANS_N_CODIGO),
SESION_N_CODIGO INT FOREIGN KEY REFERENCES TG_SESION (SESION_N_CODIGO),
SEMANA_N_CODIGO INT FOREIGN KEY REFERENCES TG_SEMANA (SEMANA_N_CODIGO),
TECNIC_N_CODIGO INT FOREIGN KEY REFERENCES TG_TECNICA (TECNIC_N_CODIGO),
TRATAM_F_ACTIVO INT DEFAULT 1
)
GO

INSERT INTO TG_TRATAMIENTO (NIVANS_N_CODIGO, SESION_N_CODIGO, SEMANA_N_CODIGO, TECNIC_N_CODIGO)
VALUES 
(2, 1, 1, 10), 
(2, 1, 1, 14), 
(2, 2, 2, 1), 
(2, 2, 2, 8), 
(2, 3, 3, 14), 
(2, 3, 3, 6), 
(2, 4, 4, 9), 
(2, 4, 4, 13)
GO

INSERT INTO TG_TRATAMIENTO (NIVANS_N_CODIGO, SESION_N_CODIGO, SEMANA_N_CODIGO, TECNIC_N_CODIGO)
VALUES 
(3, 1, 1, 2), 
(3, 1, 1, 16), 
(3, 2, 1, 10), 
(3, 2, 1, 14), 
(3, 3, 2, 3), 
(3, 3, 2, 5),
(3, 4, 2, 1), 
(3, 4, 2, 14), 
(3, 5, 3, 4), 
(3, 5, 3, 11), 
(3, 6, 3, 14), 
(3, 6, 3, 8), 
(3, 6, 3, 6), 
(3, 7, 4, 15), 
(3, 7, 4, 12), 
(3, 8, 4, 9),
(3, 8, 4, 16),
(3, 8, 4, 13)
GO

CREATE TABLE TG_DIAGNOSTICO (
DIAGNO_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
TEST_N_CODIGO	INT FOREIGN KEY REFERENCES TG_TEST (TEST_N_CODIGO),
USUARI_N_CODIGO INT FOREIGN KEY REFERENCES TG_USUARIO (USUARI_N_CODIGO),
DIAGNO_N_COGPUN DECIMAL(18,2),
DIAGNO_N_FISPUN DECIMAL(18,2),
DIAGNO_N_CONPUN DECIMAL(18,2),
DIAGNO_N_TOTPUN DECIMAL(18,2),
PUNCOG_N_CODIGO INT FOREIGN KEY REFERENCES TG_PUNTUACION_COGNITIVO (PUNCOG_N_CODIGO),
PUNFIS_N_CODIGO INT FOREIGN KEY REFERENCES TG_PUNTUACION_FISIOLOGICO (PUNFIS_N_CODIGO),
PUNCON_N_CODIGO INT FOREIGN KEY REFERENCES TG_PUNTUACION_CONDUCTUAL (PUNCON_N_CODIGO),
PUNDIR_N_CODIGO INT FOREIGN KEY REFERENCES TG_PUNTUACION_DIRECTA (PUNDIR_N_CODIGO),
NIVANS_N_CODIGO	INT FOREIGN KEY REFERENCES TG_NIVEL_ANSIEDAD (NIVANS_N_CODIGO),
DIAGNO_N_FECREG VARCHAR(8) DEFAULT CONVERT(VARCHAR, GETDATE(), 112),
DIAGNO_F_ACTIVO INT	DEFAULT 1
)
GO

CREATE TABLE TG_TRATAMIENTO_HISTORIAL (
TRAHIS_N_CODIGO INT PRIMARY KEY IDENTITY(1,1),
USUARI_N_CODIGO INT FOREIGN KEY REFERENCES TG_USUARIO (USUARI_N_CODIGO),
TRATAM_N_CODIGO INT FOREIGN KEY REFERENCES TG_TRATAMIENTO (TRATAM_N_CODIGO),
TRAHIS_T_FECCON DATETIME DEFAULT GETDATE(),
TRAHIS_F_ACTIVO INT DEFAULT 1
)
GO

/*DROP TABLE TG_SITUACION_RESPUESTA
DROP TABLE TG_RESPUESTA
DROP TABLE TG_SECCION
DROP TABLE TG_SITUACION
DROP TABLE TG_TEST*/

INSERT INTO TG_GENERO (GENERO_T_DESCRI) VALUES ('MASCULINO')
INSERT INTO TG_GENERO (GENERO_T_DESCRI) VALUES ('FEMENINO')

INSERT INTO TG_TEST (TEST_T_DESCRI) VALUES ('PRE TEST')
INSERT INTO TG_TEST (TEST_T_DESCRI) VALUES ('POST TEST')

INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Ante un examen en el que me juego mucho o si voy a ser entrevistado para un trabajo importante.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando voy a llegar tarde a una cita.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando pienso en las muchas cosas que tengo que hacer.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('A la hora de tomar una decisión o resolver un problema.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('En mi trabajo o cuando estudio.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando espero a alguien en un lugar concurrido.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Si una persona del otro sexo está muy cerca de mí, rozándome, o si estoy en una situación sexual íntima.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando alguien me molesta o cuando discuto.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando soy observado o mi trabajo es supervisado, cuando recibo críticas o siempre que pueda ser evaluado negativamente.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Si tengo que hablar en público.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando pienso en experiencias recientes en las que me he sentido ridículo, tímido, humillado, solo o rechazado.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando tengo que viajar en avión o en barco.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Después de haber cometido algún error.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Ante la consulta del dentista, las inyecciones, las heridas o la sangre.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando voy a una cita con una persona del otro sexo.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando pienso en mi futuro o en las dificultades y problemas futuros.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('En medio de multitudes o en espacios cerrados.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Cuando tengo que asistir a una reunión social o conocer gente nueva.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('En lugares altos, o ante aguas profundas.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Al observar escenas violentas.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Por nada en concreto.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('A la hora de dormir.')
INSERT INTO TG_SITUACION (SITUAC_T_DESCRI) VALUES ('Escriba una situación en la que usted manifiesta frecuentemente alguna de estas respuestas o conductas.')

INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 1)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 2)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 3)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 4)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 5)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 6)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 7)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 8)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 9)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 10)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 11)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 12)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 13)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 14)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 15)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 16)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 17)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 18)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 19)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 20)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 21)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 22)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (1, 23)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 1)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 2)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 3)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 4)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 5)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 6)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 7)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 8)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 9)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 10)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 11)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 12)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 13)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 14)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 15)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 16)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 17)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 18)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 19)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 20)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 21)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 22)
INSERT INTO TG_TEST_SITUACION (TEST_N_CODIGO, SITUAC_N_CODIGO) VALUES (2, 23)

SET IDENTITY_INSERT TG_SECCION ON
INSERT INTO TG_SECCION (SECCIO_N_CODIGO, SECCIO_T_DESCRI) VALUES (1, 'COGNITIVO')
INSERT INTO TG_SECCION (SECCIO_N_CODIGO, SECCIO_T_DESCRI) VALUES (2, 'FISIOLÓGICO')
INSERT INTO TG_SECCION (SECCIO_N_CODIGO, SECCIO_T_DESCRI) VALUES (3, 'CONDUCTUAL')
SET IDENTITY_INSERT TG_SECCION OFF

SET IDENTITY_INSERT TG_RESPUESTA ON
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (1, 'Me preocupo fácilmente.', 1) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (2, 'Tengo pensamiento o sentimientos negativos sobre mí, tales como inferior a los demás, etc.', 1) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (3, 'Me siento inseguro de mí mismo.', 1) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (4, 'Doy demasiadas vueltas a las cosas sin llegar a decidirme.', 1) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (5, 'Siento miedo.', 1) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (6, 'Me cuesta concentrarme.', 1) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (7, 'Pienso que la gente se dará cuenta de mis problemas o de la torpeza de mis actos.', 1) 

INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (8, 'Siento molestias en el estómago.', 2) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (9, 'Me sudan las manos u otra parte del cuerpo hasta en días fríos.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (10, 'Me tiemblan las manos o las piernas.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (11, 'Me duele la cabeza.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (12, 'Mi cuerpo está en tensión.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (13, 'Tengo palpitaciones, el corazón me late muy deprisa.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (14, 'Me falta el aire y mi respiración es agitada.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (15, 'Siento náuseas o mareos.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (16, 'Se me seca la boca y tengo dificultades para tragar.', 2)
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (17, 'Tengo escalofríos y tirito aunque no haga mucho frío.', 2)

INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (18, 'Lloro con facilidad.', 3) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (19, 'Realizo movimientos repetitivos con alguna parte de mi cuerpo (rascarme, tocarme, movimientos rítmicos con pies o manos, etc.)', 3) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (20, 'Fumo, como o bebo demasiado.', 3) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (21, 'Trato de evitar o rehuir la situación.', 3) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (22, 'Me muevo y hago cosas sin una finalidad concreta.', 3) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (23, 'Quedo paralizado o mis movimientos son torpes.', 3) 
INSERT INTO TG_RESPUESTA (RESPUE_N_CODIGO, RESPUE_T_DESCRI, SECCIO_N_CODIGO) VALUES (24, 'Tartamudeo o tengo otras dificultades de expresión verbal.', 3) 
SET IDENTITY_INSERT TG_RESPUESTA OFF

--COGNITIVO
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 6)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 1)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 4)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 6)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (4, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (4, 6)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 3)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 4)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 2)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 4)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 7)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (7, 4)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 2)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 7)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 6)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 7)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 4)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 6)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 7)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 6)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 3)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 5)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 6)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 4)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 5)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 6)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 7)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (14, 1)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (15, 5)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 6)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 2)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 5)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 6)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 7)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 3)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 6)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 2)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 3)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 5)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 7)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 2)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 5)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 2)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 3)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 4)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 5)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (22, 1)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (22, 2)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (22, 7)

--FISIOLOGICO
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 12)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 16)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 17)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 9)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 9)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (4, 11)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 13)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 12)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (7, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (7, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (7, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (7, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (7, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 12)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 17)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 9)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 9)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 17)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (14, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (14, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (14, 17)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (15, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (15, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (15, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (15, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 9)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 12)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 9)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 14)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 16)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 17)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 15)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 8)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 10)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 11)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 13)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 14)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 15)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 16)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (22, 11)

--CONDUCTUAL
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 22)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (1, 23)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (2, 22)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 18)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 22)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 23)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (3, 24)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (4, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (4, 22)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (4, 24)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 18)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (5, 23)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (6, 21)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (7, 20)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (8, 23)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (9, 23)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (10, 20)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (11, 22)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 21)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 22)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (12, 23)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 18)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (13, 20)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (14, 22)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (14, 24)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (15, 21)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (16, 20)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 18)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 19)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 22)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (17, 23)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 18)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 21)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 23)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (18, 24)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (19, 23)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 20)
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (20, 22)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (21, 24)
--------------------------------------------------------------------------------------
INSERT INTO TG_SITUACION_RESPUESTA (SITUAC_N_CODIGO, RESPUE_N_CODIGO) VALUES (22, 22)

--==============

INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (1, 'AUSENCIA DE ANSIEDAD', 0, 73)
INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (1, 'MODERADA', 74, 176)
INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (1, 'SEVERA', 177, 296)
INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (1, 'EXTREMA', 297, 1000)
INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (2, 'AUSENCIA DE ANSIEDAD', 0, 96)
INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (2, 'MODERADA', 97, 194)
INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (2, 'SEVERA', 195, 376)
INSERT INTO TG_PUNTUACION_DIRECTA (GENERO_N_CODIGO, PUNDIR_T_DESCRI, PUNDIR_N_MINPUN, PUNDIR_N_MAXPUN) VALUES (2, 'EXTREMA', 377, 1000)

INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (1, 'AUSENCIA DE ANSIEDAD', 0, 38)
INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (1, 'MODERADA', 39, 80)
INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (1, 'SEVERA', 81, 124)
INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (1, 'EXTREMA', 125, 1000)
INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (2, 'AUSENCIA DE ANSIEDAD', 0, 44)
INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (2, 'MODERADA', 45, 90)
INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (2, 'SEVERA', 91, 164)
INSERT INTO TG_PUNTUACION_COGNITIVO (GENERO_N_CODIGO, PUNCOG_T_DESCRI, PUNCOG_N_MINPUN, PUNCOG_N_MAXPUN) VALUES (2, 'EXTREMA', 165, 1000)

INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (1, 'AUSENCIA DE ANSIEDAD', 0, 15)
INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (1, 'MODERADA', 16, 40)
INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (1, 'SEVERA', 41, 84)
INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (1, 'EXTREMA', 85, 1000)
INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (2, 'AUSENCIA DE ANSIEDAD', 0, 16)
INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (2, 'MODERADA', 17, 49)
INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (2, 'SEVERA', 50, 124)
INSERT INTO TG_PUNTUACION_FISIOLOGICO (GENERO_N_CODIGO, PUNFIS_T_DESCRI, PUNFIS_N_MINPUN, PUNFIS_N_MAXPUN) VALUES (2, 'EXTREMA', 125, 1000)

INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (1, 'AUSENCIA DE ANSIEDAD', 0, 20)
INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (1, 'MODERADA', 21, 59)
INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (1, 'SEVERA', 60, 108)
INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (1, 'EXTREMA', 109, 1000)
INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (2, 'AUSENCIA DE ANSIEDAD', 0, 24)
INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (2, 'MODERADA', 25, 60)
INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (2, 'SEVERA', 61, 121)
INSERT INTO TG_PUNTUACION_CONDUCTUAL (GENERO_N_CODIGO, PUNCON_T_DESCRI, PUNCON_N_MINPUN, PUNCON_N_MAXPUN) VALUES (2, 'EXTREMA', 122, 1000)