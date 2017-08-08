# Flujo de trabajo

El flujo que necesitamos de esta aplicación es el siguiente:

Vamos a tener varias vacantes en Recruiterbox con una etapa llamada 'Presentar Examen'. La aplicación periódicamente va a sacar qué vacantes tienen esa etapa, las va a guardar localmente, y va a guardar el dato del `opening_id` y el `stage_id` correspondientes.

Cada una de esas vacantes va a tener que tener un examen asignado. Los exámenes estarán compuestos de varias secciones, las cuales a su vez estarán formadas de varias preguntas. Las preguntas únicamente pueden ser de dos tipos: de opción múltiple ó abiertas. Además de las preguntas, los exámenes deberán tener una calificación mínima de pase, la cuál será calculada simplemente dividiendo el número de preguntas de opción múltiple contestadas correctamente entre el número de preguntas de opción múltiple totales.

Vamos a buscar todos los candidatos de cada una de esas vacantes que estén en la etapa de 'Presentar Examen' (usando los id's previamente guardados), y vamos a filtrar por sólo los que **no tengan** el campo `exam_result` guardado. A esos, les vamos a crear, dentro de la aplicación, un perfil. Ese perfil va a usar Recruiterbox para sacar su nombre y su correo, éste último siendo obligatoriamente único. Además del perfil se creará un examen pendiente de presentar el cual corresponderá con el examen asignado para esa vacante.

Los candidatos tendrán un portal público en el cual podrán ingresar usando su correo electrónico, y únicamente podrán entrar si tienen exámenes pendientes de contestar. Ya dentro, tendrán la oportunidad de contestar el examen una vez (y sólo una vez).

Una vez terminado el examen, éste pasará por un proceso de revisión automático. En caso de ser satisfactorio, el candidato automáticamente será avanzado a la siguiente etapa. De lo contrario, el candidato será movido a un pool de rechazados llamado `calificacion de examen insuficiente`.

El portal administrativo, al cuál sólo se podra acceder si cuentas con una cuenta de correo de los dominios de Resuelve (`resuelve.mx`, `resuelvetudeuda.com`, `enconta.com`, `finx.com`, `latasa.mx`, etc.), contendrá los resultados de todos los candidatos y de todos los exámenes. Esto para dar la facilidad a los usuarios de revisar las respuestas de un candidato específico y en un futuro, poder sacar estadísticas de la calidad (o falta de la misma) de un examen.
