Imports System.Data.OleDb 'Para las conexiones tipo OleDb -- ACCESS
Public Class FormularioFuncionesADM
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a minúsculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider = Microsoft.ACE.OLEDB.12.0 ; Data Source=C:\Temp\Base de Datos de Access 2002-2003.mdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Asegurarse de que ha iniciado sesión como administrador
        If usuario = "" Then
            MsgBox("Debes Iniciar Sesión como administrador para poder operar aqui")
            Response.Redirect("default.aspx")
        Else
            If usuario <> "administrador" Then
                MsgBox("No eres el administrador. Solo puedes realizar las funciones del Usuario")
                Response.Redirect("default.aspx")
            End If
        End If
    End Sub

    Protected Sub VolverPrincipal_Click(sender As Object, e As EventArgs) Handles VolverPrincipal.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub cambiarEstadoSocio_Click(sender As Object, e As EventArgs) Handles cambiarEstadoSocio.Click
        Dim dbComm As OleDbCommand
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String

        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "SELECT estado FROM USUARIOREG WHERE usuarioLogin=?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add(New OleDbParameter("param1", OleDbType.VarChar)).Value = usuarioEstado.Text
        Dim estado As String  'Para guardar el estado del usuario en la aplicación
        estado = dbComm.ExecuteScalar()    ' Ejecuta una SELECT en la que solo se obtiene un dato

        If estado <> "A" Then
            instruccionSQL = "UPDATE USUARIOREG SET ESTADO='A' WHERE USUARIOLOGIN = ? "
        Else
            instruccionSQL = "UPDATE USUARIOREG SET ESTADO='B' WHERE USUARIOLOGIN = ? "
        End If

        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.VarChar)
        dbComm.Parameters("param1").Value = Me.usuarioEstado.Text
        dbComm.ExecuteNonQuery()
        MsgBox("Se ha actualizado el estado")
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub mostrarDatosSocio_Click(sender As Object, e As EventArgs) Handles mostrarDatosSocio.Click
        DataList1.Visible = Not DataList1.Visible
    End Sub

    Protected Sub DarDeAltaPeli_Click(sender As Object, e As EventArgs) Handles DarDeAltaPeli.Click
        Dim dbComm As OleDbCommand
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        instruccionSQL = "SELECT codigo FROM PELICULA WHERE codigo=?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add(New OleDbParameter("param1", OleDbType.Double)).Value = CDbl(codPeliculaAlta.Text)
        Dim cod As String  'Para guardar el estado del usuario en la aplicación
        cod = dbComm.ExecuteScalar()    ' Ejecuta una SELECT en la que solo se obtiene un dato
        If cod Is Nothing Then
            If codPeliculaAlta.Text = Nothing Or titPeliculaAlta.Text = Nothing Then
                MsgBox("Faltan campos por completar")
            Else
                instruccionSQL = "INSERT INTO PELICULA(codigo,titulo,fecha_anadida) VALUES(?,?,NOW()) "
                dbComm = New OleDbCommand(instruccionSQL, conexion)
                dbComm.Parameters.Add("param1", OleDbType.Double)
                dbComm.Parameters("param1").Value = CDbl(codPeliculaAlta.Text)
                dbComm.Parameters.Add("param2", OleDbType.VarChar)
                dbComm.Parameters("param2").Value = Me.titPeliculaAlta.Text
                dbComm.ExecuteNonQuery()
                MsgBox("Se ha dado de alta la película")
            End If
        Else
            MsgBox("La película ya existe")
        End If
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub DarDeBajaPeli_Click(sender As Object, e As EventArgs) Handles DarDeBajaPeli.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "SELECT Estado FROM Pelicula WHERE Codigo=?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.Double)
        dbComm.Parameters("param1").Value = CDbl(codPeliculaBaja.Text)
        Dim estadoActual As String = dbComm.ExecuteScalar()
        If estadoActual = "Alquilada" Or estadoActual = "Disponible" Then
            instruccionSQL = "UPDATE PELICULA SET estado='Descatalogada', fecha_fin_dispo=NOW()+2 WHERE codigo=?"
            dbComm = New OleDbCommand(instruccionSQL, conexion)
            dbComm.Parameters.Add("param1", OleDbType.Double)
            dbComm.Parameters("param1").Value = CDbl(codPeliculaBaja.Text)
            dbComm.ExecuteNonQuery()
            MsgBox("La película no se puede dar de baja, la fecha de fin de disponibilidad es " + (Date.Now.AddDays(2)).ToShortDateString())
        Else
            instruccionSQL = "SELECT fecha_fin_dispo FROM PELICULA WHERE codigo=?"
            dbComm = New OleDbCommand(instruccionSQL, conexion)
            dbComm.Parameters.Add("param1", OleDbType.Double)
            dbComm.Parameters("param1").Value = CDbl(codPeliculaBaja.Text)
            Dim fecha As DateTime = Convert.ToDateTime(dbComm.ExecuteScalar())
            If fecha < Date.Now() Then
                instruccionSQL = " DELETE FROM PELICULA WHERE codigo = ?"
                dbComm = New OleDbCommand(instruccionSQL, conexion)
                dbComm.Parameters.Add("param1", OleDbType.Double)
                dbComm.Parameters("param1").Value = CDbl(codPeliculaBaja.Text)
                dbComm.ExecuteNonQuery()
                MsgBox("Se ha dado de baja la película")
            Else
                MsgBox("No se puede dar de baja la fecha de fin de disponibilidad es " + fecha)
            End If
        End If
        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub mostrarDatosPeli_Click(sender As Object, e As EventArgs) Handles mostrarDatosPeli.Click
        DataList2.Visible = Not DataList2.Visible
    End Sub
End Class