<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormVerPELICULAS.aspx.vb" Inherits="ApliWebPlataforma.FormVerPELICULAS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
          .style32
        {
            width: 185px;
        }
        .style37
        {
            font-size: large;
        }
                .style100
        {
            height: 525px;
            color:Black;
            font-size:medium;
        }
          .style102
          {
              text-decoration: underline;
              font-weight: bold;
              font-size: large;
        width: 477px;
    }
    .style103
    {
        font-weight: bold;
        font-size: large;
        width: 477px;
        color: red;
    }
    .auto-style1 {
        width: 312px;
    }
    .auto-style4 {
        text-decoration: underline;
        font-weight: bold;
        font-size: large;
        width: 677px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="header"><h1 class="style37">Catálogo PELÍCULAS</h1></div>
 <div class="style100">
 <br />
            <table >
             <tr>
                    <td class="auto-style1" rowspan="3">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource2" DataKeyNames="CODE">
                            <Columns>
                                <asp:BoundField DataField="TITULO" HeaderText="TITULO" SortExpression="TITULO" />
                                <asp:BoundField DataField="CODE" HeaderText="CODE" ReadOnly="True" SortExpression="CODE" />
                            </Columns>
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand="SELECT TITULO,codigo AS [CODE]
FROM PELICULA
WHERE estado &lt;&gt; 'Descatalogada';"></asp:AccessDataSource>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="Fecha" runat="server" Text="Fecha"></asp:Label>
                        </td>
                </tr>
             <tr>
                    <td class="auto-style4">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1">
                            <Columns>
                                <asp:BoundField DataField="TITULO" HeaderText="TITULO" SortExpression="TITULO" />
                                <asp:BoundField DataField="FECHA_ANADIDA" HeaderText="FECHA_ANADIDA" SortExpression="FECHA_ANADIDA" />
                            </Columns>
                        </asp:GridView>
                        </td>
                </tr>
             <tr>
                    <td class="auto-style4">
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand="SELECT TITULO,FECHA_ANADIDA 

FROM PELICULA

WHERE fecha_anadida &gt;= DateAdd(&quot;d&quot;, -15, Now());"></asp:AccessDataSource>
                        </td>
                </tr>
                </table>
 </div>
</asp:Content>
