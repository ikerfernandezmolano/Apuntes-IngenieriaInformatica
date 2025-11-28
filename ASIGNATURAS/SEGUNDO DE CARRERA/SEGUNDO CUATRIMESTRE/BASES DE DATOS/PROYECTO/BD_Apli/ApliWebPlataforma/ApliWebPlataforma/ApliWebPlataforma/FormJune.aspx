<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormJune.aspx.vb" Inherits="ApliWebPlataforma.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #CC9900;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1"><strong>CONSULTA JUNE</strong></td>
        </tr>
        <tr>
            <td>Se muestra el número de valoraciones de cada internauta, siempre y cuando tengan más de 4.</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" BackColor="#FFFFC8" BorderColor="#CC9900" BorderStyle="Solid" BorderWidth="4px">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                        <asp:BoundField DataField="Nº PELICULAS VALORADAS" HeaderText="Nº PELICULAS VALORADAS" SortExpression="Nº PELICULAS VALORADAS" />
                    </Columns>
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand="SELECT userId AS ID, COUNT(movieId) AS [Nº PELICULAS VALORADAS]
FROM INTERNAUTA, VALORACION
WHERE id=userId
GROUP BY userId
HAVING COUNT(movieId)&gt;4
ORDER BY userId;"></asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
