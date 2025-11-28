<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormMaria.aspx.vb" Inherits="ApliWebPlataforma.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 25px;
    }
        .auto-style2 {
            color: #CC6699;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2"><strong>CONSULTA MARÍA</strong></td>
            </tr>
        <tr>
            <td class="auto-style1">Se muestran las películas mejor valoradas, es decir, las que tienen una media de valoración mayor de 3 puntos.</td>
            </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" BackColor="#FFD0E3" BorderColor="#CC6699" BorderStyle="Solid" BorderWidth="4px">
                    <Columns>
                        <asp:BoundField DataField="TITULO" HeaderText="TITULO" SortExpression="TITULO" />
                        <asp:BoundField DataField="MEDIA RATING" HeaderText="MEDIA RATING" SortExpression="MEDIA RATING" />
                    </Columns>
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand="SELECT DISTINCT titulo AS TITULO, AVG(rating) AS [MEDIA RATING]
FROM PELICULA,VALORACION
WHERE codigo=movieId
GROUP BY titulo,codigo
HAVING AVG(rating)&gt;3
ORDER BY titulo;"></asp:AccessDataSource>
            </td>
        </tr>
        </table>
</div>
</asp:Content>
