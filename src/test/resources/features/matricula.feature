# language: es
Característica: Matrícula del alumno

  La calidad revisa el recorrido completo de la fila 5: el cálculo previo, el registro
  del cobro y la regla que impide deshacer una matrícula ya liquidada.

  Antecedentes:
    Dado que dejo a AlumnaD5 frente a la API de matrícula
    Cuando AlumnaD5 obtiene su credencial con "i202610003" y "Cibertec2026"

  Escenario: Cotizar el curso de tu fila
    Cuando AlumnaD5 pide el presupuesto de "PI5620" para "i202610003"
    Entonces la API responde 200
    Y el presupuesto muestra 6 créditos, subtotal 720.0, descuento 0 y total 720.0
    Y el cuerpo valida el esquema "cotizacion.json"

  Escenario: Matricularse y pagar el curso de tu fila
    Cuando AlumnaD5 registra a "i202610003" en "PI5620"
    Entonces la API responde 201
    Y el expediente queda en "REGISTRADA"
    Y el monto del expediente es 720.0
    Y el cuerpo valida el esquema "matricula.json"
    Cuando AlumnaD5 cancela el cobro con "TARJETA"
    Entonces la API responde 200
    Y el expediente queda en "PAGADA"
    Y el expediente consigna fecha de pago
    Cuando AlumnaD5 consulta los cobros de "i202610003" por "TARJETA"
    Entonces la API responde 200
    Y el comprobante del expediente recordado usa "TARJETA" y su operación es válida

  Escenario: Regla de negocio que debe fallar
    Dado que AlumnaD5 ubica el expediente pagado de "PI5620"
    Cuando AlumnaD5 intenta anular el expediente pagado
    Entonces la API responde 409
    Y el error indica "MATRICULA_PAGADA"
    Y el cuerpo valida el esquema "error.json"
