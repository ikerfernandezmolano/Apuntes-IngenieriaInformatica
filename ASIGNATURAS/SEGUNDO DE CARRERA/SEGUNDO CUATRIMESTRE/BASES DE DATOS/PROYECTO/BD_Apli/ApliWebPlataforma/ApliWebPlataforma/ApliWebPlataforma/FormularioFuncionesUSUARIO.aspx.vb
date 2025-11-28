Imports System.Data.OleDb 'Para las conexiones tipo OleDb -- ACCESS
Public Class FormularioFuncionesUSUARIO
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a minúsculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider = Microsoft.ACE.OLEDB.12.0 ; Data Source=C:\Temp\Base de Datos de Access 2002-2003.mdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Comprobamos que se haya iniciado sesión
        If usuario = "" Then
            MsgBox("Debes Iniciar Sesión como usuario registrado para poder operar aquí")
            Response.Redirect("default.aspx")
        End If
        If Page.IsPostBack = False Then 'Solamente se hace cuando vaya a esta página
            'DECLARAR LAS VARIABLES NECESARIAS para las instrucciones de BD
            Dim conexion As OleDb.OleDbConnection
            Dim strSQL As String
            Dim dbComm As OleDbCommand
            'PASO 1. CREAR UNA CONEXION Y ABRIRLA
            conexion = New OleDb.OleDbConnection(cadenaConexion)
            conexion.Open()
            '*******************************************************************************************
            ' SE RECUPERA EL ESTADO DEL USUARIO QUE HA INICIADO LA SESIÓN
            '*******************************************************************************************
            'PASOS 2 Y 3. PREPARAR LA INSTRUCCION SQL Y EJECUTARLA
            strSQL = "SELECT estado FROM USUARIOREG WHERE usuarioLogin=?"
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.Parameters.Add(New OleDbParameter("param1", OleDbType.VarChar)).Value = usuario
            Dim estado As String  'Para guardar el estado del usuario en la aplicación
            estado = dbComm.ExecuteScalar()    ' Ejecuta una SELECT en la que solo se obtiene un dato

            '*******************************************************************************************
            ' SI ES UN USUARIO REGISTRADO ACTIVO (su estado es A), SE MUESTRAN SUS DATOS PERSONALES
            '*******************************************************************************************
            If estado <> "A" Then
                'Si su estado no es activo visualizar un mensaje
                MsgBox("Has sido dado de baja por el administrador de la plataforma. No puedes operar.")
                Response.Redirect("default.aspx")
            Else
                'Recuperar los demás datos del usuario desde la BD y mostrarlos -- EJEMPLO DE SELECT
                'PASO 2. Preparar la instrucción SQL a ejecutar
                strSQL = "SELECT nombre_apellido,direccion,credito FROM USUARIOREG WHERE usuarioLogin='" & usuario & "'"
                dbComm = New OleDbCommand(strSQL, conexion)
                'PASO 3. Ejecutarla
                Dim datosUsuarioReader As OleDbDataReader
                datosUsuarioReader = dbComm.ExecuteReader()  'Ejecuta una SELECT que obtiene varios datos
                'Tratar el resultado, es decir, los datos obtenidos por la select
                While datosUsuarioReader.Read() 'Si hay varias filas las va leyendo una por una
                    'Se asignan los datos recuperados a los distintos TextBox de la página Web
                    Me.Nombre.Text = datosUsuarioReader(0) 'Primer dato de la fila
                    Me.Direccion.Text = datosUsuarioReader(1) 'Segundo dato de la fila
                End While
            End If
            'PASO 4. CERRAR LA CONEXIÓN Y LIBERAR MEMORIA
            conexion.Close()
            conexion.Dispose()
        End If
    End Sub

    Protected Sub VolverPrincipal_Click(ByVal sender As Object, ByVal e As EventArgs) Handles VolverPrincipal.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub Aumentar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Aumentar.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "UPDATE USUARIOREG SET CREDITO=CREDITO + ? WHERE usuarioLogin=?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.Double)
        dbComm.Parameters("param1").Value = CDbl(cantidadEuros.Text)
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters("param2").Value = usuario
        dbComm.ExecuteNonQuery()
        MsgBox("Se ha aumentado el crédito del usuario")
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub Modificar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Modificar.Click
        Dim dbComm As OleDbCommand
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "UPDATE USUARIOREG SET Nombre_Apellido = ?, Direccion = ? WHERE usuarioLogin=?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.VarChar)
        dbComm.Parameters("param1").Value = Me.Nombre.Text
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters("param2").Value = Me.Direccion.Text
        dbComm.Parameters.Add("param3", OleDbType.VarChar)
        dbComm.Parameters("param3").Value = usuario
        dbComm.ExecuteNonQuery()
        MsgBox("Se han modificado los datos.")
        conexion.Close()
        conexion.Dispose()

    End Sub

    Protected Sub Alquilar_Click(sender As Object, e As EventArgs) Handles Alquilar.Click
        Dim conexion As OleDbConnection
        Dim transaccion As OleDbTransaction
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        transaccion = conexion.BeginTransaction()
        Try
            Dim dbComm1 As OleDbCommand
            Dim instruccionSQL As String
            instruccionSQL = "SELECT precio FROM PELICULA WHERE codigo=?"
            dbComm1 = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm1.Parameters.Add("param1", OleDbType.Double)
            dbComm1.Parameters("param1").Value = CDbl(Me.codigoAlquilar.Text)
            Dim precio As Double = dbComm1.ExecuteScalar()

            Dim dbComm2 As OleDbCommand
            instruccionSQL = "SELECT credito FROM USUARIOREG WHERE usuarioLogin=?"
            dbComm2 = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm2.Parameters.Add("param1", OleDbType.VarChar)
            dbComm2.Parameters("param1").Value = usuario
            Dim credito As Double = dbComm2.ExecuteScalar()
            If credito >= precio Then
                Dim dbComm3 As OleDbCommand
                instruccionSQL = "SELECT COUNT(*) FROM ALQUILA WHERE userLogin = ? AND movieId = ? AND fecha_fin>Now()"
                dbComm3 = New OleDbCommand(instruccionSQL, conexion, transaccion)
                dbComm3.Parameters.Add("param1", OleDbType.VarChar)
                dbComm3.Parameters("param1").Value = usuario
                dbComm3.Parameters.Add("param2", OleDbType.Double)
                dbComm3.Parameters("param2").Value = CDbl(Me.codigoAlquilar.Text)
                Dim pelicula As Integer = Convert.ToInt32(dbComm3.ExecuteScalar())
                If pelicula = 0 AndAlso Not Nothing Then
                    Dim dbComm4 As OleDbCommand
                    instruccionSQL = "UPDATE USUARIOREG SET credito=credito-? WHERE usuarioLogin=?"
                    dbComm4 = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm4.Parameters.Add("param1", OleDbType.Double)
                    dbComm4.Parameters("param1").Value = precio
                    dbComm4.Parameters.Add("param2", OleDbType.VarChar)
                    dbComm4.Parameters("param2").Value = usuario
                    dbComm4.ExecuteNonQuery()
                    Dim dbComm5 As OleDbCommand
                    If precio <> 0 Then
                        instruccionSQL = "INSERT INTO ALQUILA VALUES (Now(),Now()+2,?,?)"
                    Else
                        instruccionSQL = "INSERT INTO ALQUILA(fecha_ini,userId,movieId) VALUES (Now(),?,?)"
                    End If
                    dbComm5 = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm5.Parameters.Add("param1", OleDbType.VarChar)
                    dbComm5.Parameters("param1").Value = usuario
                    dbComm5.Parameters.Add("param2", OleDbType.Double)
                    dbComm5.Parameters("param2").Value = CDbl(Me.codigoAlquilar.Text)
                    dbComm5.ExecuteNonQuery()
                    Dim dbComm6 As OleDbCommand
                    instruccionSQL = "UPDATE PELICULA SET estado='Alquilada' WHERE codigo=?"
                    dbComm6 = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm6.Parameters.Add("param1", OleDbType.Double)
                    dbComm6.Parameters("param1").Value = CDbl(Me.codigoAlquilar.Text)
                    dbComm6.ExecuteNonQuery()
                    MsgBox("La acción se ha realizado de manera satisfactoria.")
                    transaccion.Commit()
                Else
                    MsgBox("Ya tienes alquilada esta película.")
                    transaccion.Rollback()
                End If
            Else
                MsgBox("No dispone de suficiente dinero para alquilar esta película.")
                transaccion.Rollback()
            End If
        Catch ex As Exception
            MsgBox("Ha habido un error: " + ex.Message)
            transaccion.Rollback()
        Finally
            conexion.Close()
            conexion.Dispose()
        End Try
    End Sub

    Protected Sub Devolver_Click(sender As Object, e As EventArgs) Handles Devolver.Click
        Dim transaccion As OleDbTransaction
        Dim conexion As OleDbConnection
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        transaccion = conexion.BeginTransaction()
        Try
            Dim dbComm As OleDbCommand
            Dim instruccionSQL As String
            instruccionSQL = "SELECT COUNT(*) FROM ALQUILA WHERE userLogin=? AND movieId=? AND fecha_fin>Now()"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = usuario
            dbComm.Parameters.Add("param2", OleDbType.Double)
            dbComm.Parameters("param2").Value = CDbl(Me.codigoDevolver.Text)
            Dim pelicula As Integer = Convert.ToInt32(dbComm.ExecuteScalar())
            If pelicula = 1 AndAlso Not Nothing Then
                instruccionSQL = "UPDATE ALQUILA SET fecha_fin=Now() WHERE userLogin=? AND movieId=?"
                dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                dbComm.Parameters.Add("param1", OleDbType.VarChar)
                dbComm.Parameters("param1").Value = usuario
                dbComm.Parameters.Add("param2", OleDbType.Double)
                dbComm.Parameters("param2").Value = CDbl(Me.codigoDevolver.Text)
                dbComm.ExecuteNonQuery()
                instruccionSQL = "SELECT COUNT(*) FROM ALQUILA WHERE movieId=? AND fecha_fin>Now()"
                dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                dbComm.Parameters.Add("param1", OleDbType.Double)
                dbComm.Parameters("param1").Value = CDbl(Me.codigoDevolver.Text)
                Dim alquilada As Integer = Convert.ToInt32(dbComm.ExecuteScalar())
                If alquilada = 0 AndAlso Not Nothing Then
                    instruccionSQL = "UPDATE PELICULA SET estado='Disponible' WHERE codigo=?"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.Double)
                    dbComm.Parameters("param1").Value = CDbl(Me.codigoDevolver.Text)
                    dbComm.ExecuteNonQuery()
                End If
                instruccionSQL = "SELECT fecha_fin FROM ALQUILA WHERE userLogin=? AND movieId=? AND fecha_fin<Now()"
                dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                dbComm.Parameters.Add("param1", OleDbType.VarChar)
                dbComm.Parameters("param1").Value = usuario
                dbComm.Parameters.Add("param2", OleDbType.Double)
                dbComm.Parameters("param2").Value = CDbl(Me.codigoDevolver.Text)
                Dim exceso As Date = dbComm.ExecuteScalar()
                Dim recargo As Integer = CInt((Now() - exceso).TotalDays)
                If recargo > 0 AndAlso Not Nothing Then
                    instruccionSQL = "SELECT precio FROM PELICULA WHERE codigo=?"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.Double)
                    dbComm.Parameters("param1").Value = CDbl(Me.codigoAlquilar.Text)
                    Dim precio As Double = dbComm.ExecuteScalar()

                    instruccionSQL = "UPDATE USUARIOREG SET CREDITO=CREDITO - ? WHERE usuarioLogin=?"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.Double)
                    dbComm.Parameters("param1").Value = recargo * precio * 0.5
                    dbComm.Parameters.Add("param2", OleDbType.VarChar)
                    dbComm.Parameters("param2").Value = usuario
                    dbComm.ExecuteNonQuery()

                    MsgBox("Se te ha aplicado un recargo de: " + recargo * precio * 0.5 + ", por el retraso en la devolución")
                End If
                MsgBox("La película se ha devuelto de manera correcta.")
                transaccion.Commit()
            Else
                MsgBox("No dispones de esta película")
            End If
        Catch ex As Exception
            MsgBox("Ha habido un error: " + ex.Message)
            transaccion.Rollback()
        Finally
            conexion.Close()
            conexion.Dispose()
        End Try
    End Sub

End Class