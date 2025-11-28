Imports System.Data.OleDb

Public Class _Default
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a minúsculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider = Microsoft.ACE.OLEDB.12.0 ; Data Source=C:\Temp\Base de Datos de Access 2002-2003.mdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Crea una VARIABLE DE SESIÓN llamada usuarioLogin y le asigna el LoginName actual pasado a minúsculas
        Session("usuarioLogin") = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
        If Page.IsPostBack = False And usuario <> "" Then 'Solamente se hace cuando vaya a esta página
            '*****************************************************************************************
            ' CUANDO SE REGISTRA UN NUEVO USUARIO SE LE DA AUTOMÁTICAMENTE DE ALTA COMO USUARIO EN LA BD
            '*****************************************************************************************
            'PASO 1. ABRIR LA CONEXION VERIFICANDO QUE SEA CORRECTA.
            'Declarar y crear una nueva conexión
            Dim conexion As OleDb.OleDbConnection
            conexion = New OleDb.OleDbConnection(cadenaConexion)
            'Intentar abrirla
            Try
                If conexion.State = ConnectionState.Closed Then
                    conexion.Open()
                End If
            Catch ex As Exception
                'No se ha podido abrir la conexión: Se debe repasar la cadena de conexión
                MsgBox("Error al conectar con la base de datos")
                Response.Write(ex.Message)
                Response.Write(". Esta es tu cadena de conexion: " & cadenaConexion)
                Response.End()
            End Try

            'PASO 2. PREPARAR LA INSTRUCCION SQL A EJECUTAR
            'Insertamos el usuario en la tabla USUARIOREG si no existe --> EJEMPLO DE INSTRUCCIÓN CON UN PARÁMETRO
            Dim strSQL As String = "INSERT INTO USUARIOREG(usuarioLogin) VALUES (?)"
            Dim dbComm As New OleDbCommand(strSQL, conexion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar, 50)
            dbComm.Parameters("param1").Value = usuario

            'PASO 3. EJECUTAR LA INSTRUCCION VERIFICANDO QUE SEA CORRECTA (depende de si es una SELECT o no)
            Try
                'Ejecutamos el INSERT
                dbComm.ExecuteNonQuery()   'Ejecuta cualquier instrucción que no sea SELECT 
                MsgBox("Se ha dado de alta a un nuevo usuario registrado")
            Catch exSql As Exception
                'Si da error es que el usuario ya existe. En realidad no es un error para nosotros.
                'No hacemos nada
            Finally
                'PASO 4. CERRAR conexion Y LIBERAR MEMORIA
                'Cerramos la conexión y liberamos la memoria que hayamos podido utilizar
                If conexion.State = ConnectionState.Open Then
                    conexion.Close()
                    conexion.Dispose()
                End If
            End Try
        End If
    End Sub

End Class