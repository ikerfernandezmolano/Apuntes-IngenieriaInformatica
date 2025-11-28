<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormularioFuncionesADM.aspx.vb" Inherits="ApliWebPlataforma.FormularioFuncionesADM" %>
   <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
       <style type="text/css">
        .style2
        {
            width: 66px;
        }
        .style3
        {
            text-align: justify;
            
        }
        .style12
        {
            width: 10px;
        }
        .style20
        {
            width: 202px;
        }
        .style23
        {
            width: 73px;
        }
        .style24
        {
            width: 309px;
           
        }
        .style27
        {
            width: 320px;
        }
        .style28
        {
            width: 174px;
        }
        .style31
        {
            width: 158px;
              color: #FF0000;
          }
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
            
            color:Black;
            font-size:medium;
              height: 426px;
          }
          .style102
          {
              text-decoration: underline;
              font-weight: bold;
              font-size: large;
          }
          .style103
          {
              width: 320px;
              color: #FF0000;
          }
          .style104
          {
              width: 309px;
              color: #FF0000;
          }
           .auto-style1 {
               width: 185px;
               height: 35px;
           }
           .auto-style2 {
               text-decoration: underline;
               font-weight: bold;
               font-size: large;
               height: 35px;
           }
           .auto-style3 {
               width: 202px;
               height: 33px;
           }
           .auto-style4 {
               width: 10px;
               height: 33px;
           }
           .auto-style5 {
               width: 309px;
               height: 33px;
           }
           .auto-style6 {
               width: 158px;
               color: #FF0000;
               height: 33px;
           }
           .auto-style7 {
               width: 73px;
               height: 33px;
           }
    </style>
 </asp:Content>
   

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="header"><h1 class="style37">Funciones ADMINISTRADOR</h1></div>
    <div class="style100">
    
        <br />

        <table >
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    Realice todas las funciones que quiera . Rellene los datos oportunos y pulse el 
                    botón.<br />
                    </td>
            </tr>
        </table>
            <br />
            <table >
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style102">
                        Cambiar estado de un usuario</td>
                </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style27" >
                    Cuenta del usuario a 
                    cambiar de estado</td>
                <td class="style28">
                    <asp:DropDownList ID="usuarioEstado" runat="server" DataSourceID="AccessDataSource1" DataTextField="usuarioLogin" DataValueField="usuarioLogin">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand="SELECT usuarioLogin FROM USUARIOREG WHERE usuarioLogin&lt;&gt;'administrador'"></asp:AccessDataSource>
                </td>
                <td>
                    <asp:Button ID="cambiarEstadoSocio" runat="server" Text="Cambiar estado" />
                </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style103" >
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="usuarioLogin" DataSourceID="AccessDataSource2" ForeColor="#666666">
                        <ItemTemplate>
                            usuarioLogin:
                            <asp:Label ID="usuarioLoginLabel" runat="server" Text='<%# Eval("usuarioLogin") %>' />
                            <br />
                            Nombre_Apellido:
                            <asp:Label ID="Nombre_ApellidoLabel" runat="server" Text='<%# Eval("Nombre_Apellido") %>' />
                            <br />
                            Direccion:
                            <asp:Label ID="DireccionLabel" runat="server" Text='<%# Eval("Direccion") %>' />
                            <br />
                            Credito:
                            <asp:Label ID="CreditoLabel" runat="server" Text='<%# Eval("Credito") %>' />
                            <br />
                            Fecha_Hora_Alta:
                            <asp:Label ID="Fecha_Hora_AltaLabel" runat="server" Text='<%# Eval("Fecha_Hora_Alta") %>' />
                            <br />
                            Estado:
                            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Eval("Estado") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand=" Select * From USUARIOREG Where usuarioLogin =?;">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="usuarioEstado" Name="?" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style28">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="mostrarDatosSocio" runat="server" Text="Mostrar/Ocultar usuario" />
                </td>
            </tr>
        </table>
             
               <br />
        <table >
            <tr>
                <td class="auto-style1">
                    </td>
                <td class="auto-style2">
                    Dar de alta una película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="auto-style3">
                    </td>
                <td class="auto-style4">
                    </td>
                <td class="auto-style5">
                    Código de la película a dar de alta</td>
                <td class="auto-style6">
                    <asp:TextBox ID="codPeliculaAlta" runat="server"  
                        ToolTip="Introduzca el código de la película a dar de alta" SkinID="-1"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Button ID="DarDeAltaPeli" runat="server" Text="Dar de alta película" />
                    </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Título de la película a dar de alta</td>
                <td class="style31">
                    <asp:TextBox ID="titPeliculaAlta" runat="server"></asp:TextBox>
                </td>
                <td class="style23">
                    &nbsp;</td>
            </tr>
            </table>
                      <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Dar de baja una película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Código de la película a dar de baja</td>
                <td class="style31">
                    <asp:TextBox ID="codPeliculaBaja" runat="server"  
                        ToolTip="Introduzca el código de la película a dar de baja" SkinID="-1"></asp:TextBox>
                </td>
                <td class="style23">
                    <asp:Button ID="DarDeBajaPeli" runat="server" Text="Dar de baja esta película" />
                    </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style104">
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="codigo" DataSourceID="AccessDataSource3" ForeColor="#666666">
                        <ItemTemplate>
                            codigo:
                            <asp:Label ID="codigoLabel" runat="server" Text='<%# Eval("codigo") %>' />
                            <br />
                            titulo:
                            <asp:Label ID="tituloLabel" runat="server" Text='<%# Eval("titulo") %>' />
                            <br />
                            precio:
                            <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                            <br />
                            estado:
                            <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                            <br />
                            fecha_anadida:
                            <asp:Label ID="fecha_anadidaLabel" runat="server" Text='<%# Eval("fecha_anadida") %>' />
                            <br />
                            fecha_fin_dispo:
                            <asp:Label ID="fecha_fin_dispoLabel" runat="server" Text='<%# Eval("fecha_fin_dispo") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="C:\Temp\Base de Datos de Access 2002-2003.mdb" SelectCommand="SELECT * FROM PELICULA WHERE codigo=?;">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="codPeliculaBaja" Name="?" PropertyName="Text" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style31">
                    &nbsp;</td>
                <td class="style23">
                    <asp:Button ID="mostrarDatosPeli" runat="server" 
                        Text="Mostrar/Ocultar película" />
                </td>
            </tr>
            </table>
    <table>
    <asp:Button ID="VolverPrincipal" runat="server" Text="Volver a la Página Principal" />
    </table>
    </div>
</asp:Content>
