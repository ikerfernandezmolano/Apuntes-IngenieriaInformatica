Public Class FormVerPELICULAS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim varFecha As DateTime = DateTime.Now
        Me.Fecha.Text = "ESTRENOS QUINCENA (fecha de hoy=" & varFecha & ")"
    End Sub
End Class