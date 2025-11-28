<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormIker.aspx.vb" Inherits="ApliWebPlataforma.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #666699;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1"><strong>CONSULTA IKER</strong></td>
        </tr>
        <tr>
            <td>Se muestran los internautas más críticos, aquellos que tienen una media menor de 2 en sus valoraciones. </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" BackColor="#CFD1F1" BorderColor="#666699" BorderStyle="Solid" BorderWidth="4px" ForeColor="#6600CC">
                    <Columns>
                        <asp:BoundField DataField="userId" HeaderText="userId" SortExpression="userId" />
                        <asp:BoundField DataField="MEDIA VALORACION" HeaderText="MEDIA VALORACION" ReadOnly="True" SortExpression="MEDIA VALORACION" />
                    </Columns>
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand="SELECT userId, AVG(rating) AS [MEDIA VALORACION]
FROM INTERNAUTA, VALORACION
WHERE userId=id
GROUP BY userId
HAVING AVG(rating)&lt;2
ORDER BY userId;"></asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
