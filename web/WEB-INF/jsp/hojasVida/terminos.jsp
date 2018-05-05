<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<!-- INICIO FORMULARIO-->
<div id="contenido"> 
    <form method="POST" id="terminos">
        <div  id="md_acepto" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" id="modal-terminos">
            <div class="modal-content">
                <div class="modal-header mhsuccess">
                    <button class="close" data-dismiss="modal"><label style="color:white !important;">&times;</label></button>
                </div>
                <div class="modal-body" >
                   <div id="alert_terminos"></div> 
                   <div class="form-group" id="tabssmall">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#datosol">
                                Terminos y condiciones de uso</a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#datoscon">
                                Tratamiento de datos personales</a>
                        </li>
                    </ul>
                    <div class="tab-content" style="overflow-y: scroll !important; height: 400px;overflow-x:hidden;">
                        <div id="datosol" class="tab-pane fade in active">
                            <div class="container" >
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group" >
                                            <div class="table-responsive" id="tablep">
                                                <center><table class="table table-bordered tableestilo" >
                                                        <thead>
                                                            <tr>
                                                                <th>TÉRMINOS Y CONDICIONES DE USO
                                                                    <p><span>Sistema Banco Único de Hojas de Vida –BUHO–</span></p></th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td style="padding:0cm 5.4pt 0cm 5.4pt;"><p>El uso y acceso al
                                                                    aplicativo del Sistema Banco Único de Hojas de Vida &#45; en adelante BUHO &#45; está
                                                                    sujeto a los siguientes &quot;Términos y Condiciones de Uso&quot; que
                                                                    reglamentan las políticas frente al tratamiento de la información que reposa
                                                                    en las bases de datos del sistema BUHO. Para hacer uso de este Servicio,
                                                                    usted deberá leer atentamente estas condiciones y declarar su acuerdo
                                                                    diligenciando la casilla "Acepto los Términos y Condiciones" que aparecen al
                                                                    final de cada texto. En caso de que no señale dicha casilla o no acepte estas
                                                                    condiciones, no podrá utilizar este Sitio Web.</p>
                                                                <p >Al utilizar este Sitio
                                                                    Web, usted declara la aceptación del tratamiento de la información que cargue
                                                                    al mismo, con el propósito que la misma circule y sea compartida para efectos
                                                                    de intermediación laboral. Los alcances de dicha intermediación se detallan
                                                                    más adelante.</p>
                                                                <p >La Facultad Nacional
                                                                    de Salud Pública podrá revisar estos Términos y Condiciones de Uso en
                                                                    cualquier momento, actualizando su contenido. Usted deberá visitar esta
                                                                    página cada vez que acceda al Sitio para revisar los Términos y Condiciones
                                                                    de Uso, en cuanto son vinculantes</p></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table class="table table-bordered tableestilo" >
                                                        <thead>
                                                        <th colspan="2">1. DEFINICIONES PREVIAS</th>
                                                        </thead>
                                                        <tr>
                                                            <td style="width:96.45pt"><strong>BUHO</strong></td>
                                                            <td><p>Sistema Banco Único de
                                                                    Hojas de Vida es el Sistema, donde se realizan todas las transacciones para
                                                                    el registro de hojas de vida y además permite el enlace a un módulo para
                                                                    presentarse a las convocatorias de la Universidad.</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:96.45pt">
                                                                <strong>Usuario</strong>
                                                            </td>
                                                            <td><p>Se refiere a todas las
                                                                    personas naturales o jurídicas o entidades que por cualquier razón accedan o
                                                                    usen este aplicativo. Por regla general se entenderá que el término usuario
                                                                    refiere a los buscadores de empleo y usuarios internos del sistema.</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><strong>Buscador de convocatorias</strong></td>
                                                            <td><p>Persona natural que se
                                                                    encuentra en condiciones de trabajar y está en un proceso de postularse a las
                                                                    convocatorias de empleo disponibles en la Facultad Nacional de Salud Pública
                                                                    en adelante FNSP.</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><strong>Convocatorias</strong></td>
                                                            <td><p>Invitaciones para
                                                                    optar por un puesto de trabajo no ocupado, para el cual el la Facultad
                                                                    Nacional de Salud Pública, mediante un proceso de selección decide encontrar
                                                                    el candidato idóneo para cubrirlo.</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><strong>Candidatos</strong></td>
                                                            <td><p>Son los buscadores de
                                                                    empleo que cumplen con el perfil de una vacante y se han postulado
                                                                    directamente a la misma o que han sido preseleccionados para optar por dicha
                                                                    vacante.</p></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table class="table table-bordered tableestilo">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2">2. NORMAS DE USO GENERAL</th>
                                                            </tr>
                                                            <tr>
                                                                <th style="text-align: left;">Numeral</th>
                                                                <th style="width:56.8pt;">Acepto</th>
                                                            </tr>

                                                        </thead>
                                                        <tr>
                                                            <td><p>2.1 Postulación: es el proceso que queda registrado en el
                                                                    aplicativo del BUHO mediante el cual los buscadores de empleo optan por las
                                                                    vacantes que se ajustan a sus perfiles, a través de los siguientes canales::
                                                                    i) proceso de auto consulta, donde los candidatos evalúan a través del
                                                                    aplicativo las vacantes que se ajustan a su perfil y aplican a las de su
                                                                    conveniencia; ii) publicación de ofertas por diferentes medios sobre las
                                                                    vacantes disponibles las cuales están acordes con el perfil del buscador;
                                                                    iii) proceso de preselección, donde la FNSP, desde uno de sus puntos de
                                                                    atención, realiza una búsqueda entre los buscadores inscritos, de aquellos
                                                                    que cumplan con el perfil requerido por el empleador y proceden a la revisión
                                                                    de su hoja de vida, para someterla al proceso de reclutamiento.</p></td>
                                                            <td><input type="checkbox" name="postulacion" style="margin-top: 70%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>2.2. Entrevista: dentro del proceso de selección y vinculación
                                                                    laboral establecido, es muy probable que el candidato deba presentarse
                                                                    personalmente para los tramites de entrevistas y pruebas. Por esta razón se
                                                                    recomienda que el candidato considere SOLAMENTE las vacantes de las regiones,
                                                                    donde tenga la seguridad de que puede presentarse personalmente.</p></td>
                                                            <td><input type="checkbox" name="entrevista" style="margin-top: 40%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>2.3. Vinculación laboral: Los candidatos deben tener en cuenta
                                                                    que el hecho de postularse o ser remitidos a un proceso de preselección, así
                                                                    como el de presentarse a una entrevista, no garantiza su contratación. Dicha
                                                                    decisión le corresponde exclusivamente a la FNSP.</p>

                                                            </td>
                                                            <td><input type="checkbox" name="vinculacionLaboral" style="margin-top: 20%;"></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table class="table table-bordered tableestilo">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2">3. OBLIGACIONES DEL USUARIO.</th>
                                                            </tr>
                                                            <tr>
                                                                <th>Numeral</th>
                                                                <th style="width:56.8pt;">Acepto</th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td><p>3.1. Responsabilidad:
                                                                    Los usuarios en general (buscadores de empleo, empresarios y prestadores del
                                                                    Servicio Público de Empleo) son responsables de mantener la confidencialidad,
                                                                    custodia y buen uso de sus datos, de su contraseña, así como de toda la
                                                                    información que conozcan a través del aplicativo del BUHO. Serán así mismo,
                                                                    responsables de todos los usos de su registro. En caso de olvido,
                                                                    manipulación, inactivación o sospecha de fraude o utilización indebida, los
                                                                    usuarios deberán notificar inmediatamente a la FNSP cualquier uso sin
                                                                    autorización de su registro o contraseña. Así mismo, serán responsables de
                                                                    todos los envíos transmitidos a través de su cuenta y clave privada de
                                                                    acceso, los cuales se supondrán emitidos por el usuario.</p></td>
                                                            <td><input type="checkbox" name="responsabilidad" style="margin-top: 70%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.2. Veracidad y
                                                                    confiabilidad de la información. Será responsabilidad de los usuarios
                                                                    registrar información veraz, seria y verificable en los campos
                                                                    correspondientes del aplicativo, bien sea información personal, empresarial o
                                                                    referente a las vacantes, según sea el caso.</p></td>
                                                            <td><input type="checkbox" name="veracidad" style="margin-top: 30%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.3. Actualización de
                                                                    la información. Los usuarios deberán mantener actualizada la información de
                                                                    sus registros y transacciones correspondientes.</p></td>
                                                            <td><input type="checkbox" name="actualizacionInformacion" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.4. Racionalidad. La
                                                                    FNSP, así como su plataforma informática -SISE- constituyen un bien público,
                                                                    por esta razón todos los usuarios se comprometen a darle un uso racional a la
                                                                    página y los servicios que de allí se deriven, observando la ley y las buenas
                                                                    costumbres, el orden público y la moral.</p></td>
                                                            <td><input type="checkbox" name="racionalidad" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.5. Uso ilegal. Los
                                                                    usuarios no podrán utilizar ésta página web para la transmisión, publicación
                                                                    o comunicación de cualquier tipo de información diferente a la requerida en
                                                                    este portal, ilegal, dañina u objetable, que contraríe la Constitución
                                                                    Política de Colombia, las leyes y las buenas costumbres. La FNSP se reserva
                                                                    el derecho de determinar el uso ilegal u objetable que de la página se haga
                                                                    y, en consecuencia, podrá tomar las medidas legales y administrativas que
                                                                    considere convenientes.</p></td>
                                                            <td><input type="checkbox" name="usoIlegal" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.6. Publicidad. La
                                                                    presente página constituye un bien público, por lo tanto está prohibido
                                                                    utilizar esta página para realizar cualquier tipo de publicidad comercial.</p></td>
                                                            <td><input type="checkbox" name="publicidad" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.7. Daños y
                                                                    perjuicios. Cada usuario deberá responder y asumir los daños y perjuicios de
                                                                    toda naturaleza que la página de Internet del Servicio Público de Empleo
                                                                    pueda sufrir, directa o indirectamente, como consecuencia del incumplimiento
                                                                    de cualquiera de las obligaciones derivadas de los presentes términos y
                                                                    condiciones o acciones contrarias a las leyes en relación con la utilización
                                                                    de la misma. Ningún usuario podrá tomar acciones que entrañen riesgo, daño o
                                                                    inutilización de esta página o de los Servicios y/o del contenido que de ella
                                                                    se deriven.</p></td>
                                                            <td><input type="checkbox" name="danyosPerjuicios" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.8. Derechos
                                                                    reservados. Los usuarios deberán respetar los emblemas, marcas comerciales
                                                                    registradas, y demás objetos de propiedad intelectual pertenecientes a la
                                                                    FNSP. Los derechos de autor sobre las páginas, las imágenes y en general todo
                                                                    lo que aparece en pantalla, así como sobre la información y el material
                                                                    contenidos en las mismas, son propiedad del Servicio Público de Empleo. En
                                                                    este sentido, queda prohibido a todos los usuarios que por sí mismos o por
                                                                    interpuesta persona accedan al sistema con el fin de reproducir,
                                                                    retransmitir, distribuir, vender, publicar, divulgar, circular o
                                                                    comercializar, y en general, disponer por cualquier medio de la información
                                                                    allí contenida, total o parcialmente.
                                                                </p></td>
                                                            <td><input type="checkbox" name="derechosReservados" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.9.Ingreso ilegal.
                                                                    Todo usuario y el público en general, deberán abstenerse de ingresar
                                                                    ilegalmente a la página, hackear o piratear alguno de sus contenidos, así
                                                                    como intentar obtener información, mensajes, gráficos, dibujos y/o imágenes,
                                                                    fotografías, grabaciones, software y, en general, cualquier clase de material
                                                                    accesible a través de ésta página.</p></td>
                                                            <td><input type="checkbox" name="ingresoIlegal" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p>3.10.Seguridad.Se
                                                                    prohíbe a los usuarios violar o intentar violar la seguridad del aplicativo
                                                                    del Servicio Público de Empleo, incluyendo pero no limitándose a:</p>
                                                                <p>a) Acceder a
                                                                    datos, cuentas o servidores no autorizados.</p>
                                                                <p>b) Evaluar o
                                                                    probar la vulnerabilidad de un sistema o red.</p>
                                                                <p>c) Intentar
                                                                    impedir el servicio a cualquier usuario, anfitrión o red, mediante el envío
                                                                    de virus al Sitio Web, o mediante saturación, envíos masivos
                                                                    (&quot;flooding&quot;), &quot;spamming&quot;, bombardeo de correo o bloqueos
                                                                    del sistema (&quot;crashing&quot;)</p>
                                                                <p>d) Enviar
                                                                    correos no solicitados, incluyendo promociones y/o publicidad de productos o
                                                                    servicios.</p>
                                                                <p>e) Utilizar la
                                                                    información consignada en las bases de datos del sistema para fines
                                                                    diferentes a procesos de intermediación laboral, así como intentar tomar
                                                                    información personal de los usuarios para contactarlos, suplantar el nombre
                                                                    del Servicio Público de Empleo.</p>
                                                                <p>f) Utilizar
                                                                    el Sistema para obtener cualquier clase de beneficio, sin seguir los
                                                                    protocolos establecidos para la gestión y colocación de empleo.</p>
                                                                <p>g) Falsificar
                                                                    cualquier cabecera de paquete TCP/IP o cualquier parte de la información de
                                                                    la cabecera de cualquier correo electrónico o en mensajes de foros de debate.</p>
                                                                <p>h) Borrar,
                                                                    adulterar, filtrar, deshabilitar o revisar cualquier material e información
                                                                    anunciado por otra persona o entidad.</p>
                                                                <p>i) La FNSP se
                                                                    reserva el derecho de retirar o solicitar que sea excluida información que no
                                                                    cumpla con las obligaciones de los usuarios, así como podrá decidir la
                                                                    suspensión o la des-habilitación definitiva del usuario infractor, siendo
                                                                    siempre obligación del Servicio Público de Empleo y de cualquiera de sus
                                                                    prestadores autorizados poner en conocimiento de las autoridades judiciales y
                                                                    administrativas competentes los hechos considerados como posibles faltas
                                                                    disciplinarias o punibles penalmente.
                                                            </td>
                                                            <td><input type="checkbox" name="seguridad" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p>3.11. Habeas Data o
                                                                    Protección de datos personales. Cuando usted se registra en este aplicativo
                                                                    se le solicitará que suministre a los prestadores del Servicio Público de
                                                                    Empleo información para efectos de prestar servicios de gestión y colocación
                                                                    de empleo. En adición a los términos y condiciones que puedan ser previstos
                                                                    en otras políticas de privacidad en este aplicativo, usted entiende y acepta
                                                                    que los Prestadores del Servicio Público de Empleo compartan y permitan
                                                                    consultar sus datos personales a terceras personas con el fin de prestar los
                                                                    servicios de gestión y colocación de empleo. Los empleadores podrán preservar
                                                                    su confidencialidad en los términos previstos en el parágrafo del artículo 3º
                                                                    de la Resolución 2605 de 2014 del Ministerio del Trabajo.</p>
                                                            </td>
                                                            <td><input type="checkbox" name="habeasData" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>3.12.Reserva
                                                                    estadística. Además del fin previsto en el anterior numeral, los datos
                                                                    consignados en este aplicativo solo podrán ser usados para realizar análisis
                                                                    del mercado laboral, conservando el respectivo anonimato del usuario o
                                                                    empresa. No podrán ser usados para fines tributarios, fiscales o afines.</p></td>
                                                            <td><input type="checkbox" name="reservaEstadistica" style="margin-top: 20%;"></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table class="table table-bordered tableestilo">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2">4. CONDICIONES ESPECIALES DE USO.</th>
                                                            </tr>
                                                            <tr>
                                                                <th style="text-align: left;">Numeral</th>
                                                                <th style="width:56.8pt;">Acepto</th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td><p>4.1. Títulos. Los títulos,
                                                                    encabezados o similares que se utilizan en la página de Internet, tienen como
                                                                    único propósito el servir de guía o ayuda al usuario.</p></td>
                                                            <td><input type="checkbox" name="titulos" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>4.2. Modificación de
                                                                    condiciones. La FNSP podrá actualizar o modificar las condiciones y avisos de
                                                                    los servicios de su página web periódicamente, para reflejar cambios en el
                                                                    servicio, cambios en la normativa que puedan influir en la prestación de los
                                                                    servicios o por cualquier otro motivo. Es responsabilidad del usuario
                                                                    comprobar las condiciones y avisos periódicamente. El uso de los servicios a
                                                                    través de la clave privada de acceso, después de que se haya llevado a cabo
                                                                    cualquier modificación, implicará la aceptación de dicho cambio. A menos que
                                                                    se indique explícitamente lo contrario, cualquier característica nueva que
                                                                    modifique o mejore los servicios web estará sujeta a las condiciones de uso y
                                                                    a sus modificaciones.</p></td>
                                                            <td><input type="checkbox" name="modificacionCondiciones" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>4.3. Interrupción del
                                                                    servicio. La FNSP podrá interrumpir discrecionalmente, en cualquier momento y
                                                                    sin necesidad de previo aviso, el acceso a los servicios de la página web o a
                                                                    una parte de los mismos.</p></td>
                                                            <td><input type="checkbox" name="interrupcionServicio" style="margin-top: 20%;"></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table class="table table-bordered tableestilo">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2">5. LIMITACIÓN Y EXONERACIÓN DE RESPONSABILIDAD DEL SERVICIO
                                                                    PÚBLICO DE EMPLEO.</th>
                                                            </tr>
                                                            <tr>
                                                                <th style="text-align: left;">Numeral</th>
                                                                <th style="width:56.8pt;">Acepto</th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td><p>5.1. Conectividad y
                                                                    uso.En ningún caso el Servicio Público de Empleo será responsable por daños
                                                                    directos, indirectos, especiales, o accidentales, ni por las pérdidas o
                                                                    gastos que pudiesen surgir por conectarse a la página web o a partir del uso
                                                                    que se haga del sitio, o por la incapacidad para hacer uso del sitio por
                                                                    parte de cualquier persona, o por cualquier falla en la ejecución, error,
                                                                    omisión, interrupción, defecto, demora en la transmisión o en la conexión, o
                                                                    por la existencia de un virus en la computadora o por fallas del sistema o la
                                                                    línea, o por su suspensión o terminación, aun cuando el Servicio Público de
                                                                    Empleo o sus representantes se encuentren notificados sobre la posibilidad de
                                                                    tales daños, pérdidas o gastos.</p></td>
                                                            <td><input type="checkbox" name="conectividadUso" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>5.2. Interconectividad
                                                                    con otras páginas. Esta página contiene links o puede generar conexiones a
                                                                    otras direcciones en Internet. La FNSP no tiene ningún tipo de control sobre
                                                                    el contenido de estas páginas, por lo tanto, no es responsable del contenido
                                                                    o políticas que contengan, ni de los daños que su acceso ocasione al usuario.</p></td>
                                                            <td><input type="checkbox" name="interconectividad" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>5.3. Daños externos.
                                                                    La FNSP se declara ajeno a cualquier responsabilidad por daños que llegare a
                                                                    sufrir el hardware y el software, o cualquier aparato electrónico a través
                                                                    del cual se accede al sistema de operación. Igualmente, no tendrá ninguna
                                                                    responsabilidad por las interrupciones en la transmisión, errores técnicos o
                                                                    de fallas o demoras en el desempeño de la página, cualquier clase de virus o
                                                                    demoras en el proceso transaccional.
                                                                </p></td>
                                                            <td><input type="checkbox" name="danyosExternos" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p>5.4 Presencia de
                                                                    virus. La FNSP no controla ni garantiza la ausencia de virus ni de otros
                                                                    elementos en los contenidos que puedan producir alteraciones en el sistema
                                                                    informático (software y hardware) o en los documentos electrónicos y archivos
                                                                    almacenados en el sistema informático del usuario. La FNSP no asume
                                                                    responsabilidad alguna por los daños y perjuicios de cualquier naturaleza que
                                                                    puedan derivarse de la presencia de virus o la presencia de otros elementos
                                                                    en los contenidos que puedan producir alteraciones en el sistema informático,
                                                                    documentos electrónicos o archivos del usuario.</p></td>
                                                            <td><input type="checkbox" name="presenciaVirus" style="margin-top: 20%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p>5.5. Otras exoneraciones.
                                                                    La FNSP no asume responsabilidad alguna por los daños y perjuicios de
                                                                    cualquier naturaleza que puedan derivarse de la transmisión, difusión,
                                                                    almacenamiento, puesta a disposición, recepción, obtención o acceso al
                                                                    contenido de la página internet, y en particular, aunque no de modo
                                                                    exclusivo, por los daños y perjuicios que puedan ocasionarse por:</p>
                                                                <p>a) El incumplimiento de la ley, la moral y las buenas costumbres generalmente
                                                                    aceptadas o el orden público como consecuencia de la transmisión, difusión,
                                                                    almacenamiento, puesta a disposición, recepción, obtención o acceso al
                                                                    contenido de la página.</p>
                                                                <p>b) La infracción de los derechos de propiedad intelectual e industrial, de los
                                                                    secretos empresariales, de compromisos contractuales de cualquier índole, de
                                                                    los derechos al honor, a la intimidad personal y familiar y a la imagen de
                                                                    las personas, de los derechos de propiedad y de toda otra naturaleza
                                                                    pertenecientes a un tercero como consecuencia de la transmisión, difusión,
                                                                    almacenamiento, puesta a disposición, recepción, obtención o acceso al
                                                                    contenido de la página.</p>
                                                                <p>c) La realización de
                                                                    actos de competencia desleal y publicidad ilícita como consecuencia de la
                                                                    transmisión, difusión, almacenamiento, puesta a disposición, recepción, obtención
                                                                    o acceso al contenido de la página.</p>
                                                                <p>d) La falta de exhaustividad, pertinencia y/o actualidad del contenido de la página.</p>
                                                                <p>e) El hecho de que las expectativas generadas por el contenido de la página no se consideren
                                                                    adecuadas para algún propósito.</p>
                                                                <p>f) El incumplimiento, retraso en el cumplimiento, cumplimiento defectuoso o terminación por
                                                                    cualquier causa de las obligaciones contraídas con terceros a través de o con
                                                                    motivo del acceso al contenido de la página.</p>
                                                            </td>
                                                            <td><input type="checkbox" name="otrasExoneraciones" style="margin-top: 20%;"></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                                <center>
                                                    <table class="table table-bordered tableestilo">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2">6. DISPOSICIONES FINALES</th>
                                                            </tr>
                                                            <tr>
                                                                <th style="text-align: left;">Numeral</th>
                                                                <th style="width:56.8pt;">Acepto</th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td><p>La violación de
                                                                    cualquiera de los términos y condiciones de uso de esta plataforma
                                                                    informática puede acarrear responsabilidades civiles, penales y/o
                                                                    disciplinarias según corresponda. La FNSP pondrá en conocimiento de las
                                                                    autoridades competentes cualquier irregularidad que ponga en riesgo el
                                                                    funcionamiento de esta plataforma, con el fin que se adelanten las
                                                                    investigaciones y acciones legales del caso. Los presentes Términos y
                                                                    Condiciones se rigen por las leyes colombianas. La jurisdicción para
                                                                    cualquier reclamación que surja de estos Términos y Condiciones será
                                                                    exclusivamente la de los tribunales y jueces de la República de Colombia. Si
                                                                    algún aparte de estos Términos y Condiciones es declarada nula o inválida o
                                                                    ineficaz, ello no afectará la validez del contenido restante de estos
                                                                    Términos</p></td>
                                                            <td><input type="checkbox" name="disposicionesFinales" style="margin-top: 20%;"></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="datoscon" class="tab-pane fade">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="table-responsive" id="tablep">
                                                <center>
                                                    <table class="table table-bordered tableestilo">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2">AVISO DE AUTORIZACIÓN PARA TRATAMIENTO DE DATOS PERSONALES</th>
                                                            </tr>
                                                            <tr>
                                                                <th style="text-align: left;">Numeral</th>
                                                                <th style="width:56.8pt;">Acepto</th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td><p>Debido a que la
                                                                    prestación de los servicios de gestión y colocación requieren del suministro
                                                                    de información, de conformidad con lo dispuesto por la Ley 1636 de 2013 y el
                                                                    Decreto 2852 de 2013, de manera voluntaria, previa, explícita, informada e
                                                                    inequívoca, otorgo consentimiento en los términos establecidos por la Ley
                                                                    Estatutaria 1581 de 2012 y reglamentada por el Decreto 1377 de 2013 para que
                                                                    se efectúe el tratamiento de la información suministrada para el fin
                                                                    exclusivo de realizar las labores de intermediación laboral, análisis
                                                                    ocupacional en mi favor y demás servicios a los que pueda tener acceso, de
                                                                    conformidad con los criterios definidos por el Servicio Público de Empleo y
                                                                    lo definido y autorizado por el Ministerio del Trabajo. El manejo de mi
                                                                    información igualmente lo autorizo para que se realice según los términos y
                                                                    exigencias de la Ley 1636 y el Decreto 2852 de 2013.</p></td>
                                                            <td><input type="checkbox" name="tratamientosDatosPersonales" style="margin-top: 20%;"></td>
                                                        </tr>
                                                    </table>
                                                </center>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Acepto</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
        </div>
        <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#md_acepto').modal('show');
    });
    
     $('#terminos').submit(function (evt) {
        evt.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hojasVida/terminos",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("X-CSRF-Token", $('#_csrf').val());
            },
            success: function (response) {
                if (response === "") {
                    window.location.href = '${pageContext.request.contextPath}/hojasVida/editar';
                } else {
                    bootstrap_alert_terminos.warning(response);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                bootstrap_alert_terminos.warning("Error al almacenar al aceptar los términos.");
            }});
    });
    
    bootstrap_alert_terminos = {};
    bootstrap_alert_terminos.warning = function (message) {
        $('#alert_terminos').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>');
    };
    bootstrap_alert_terminos.removeWarning = function () {
        $('#alert_terminos').html('');
    };
</script>
