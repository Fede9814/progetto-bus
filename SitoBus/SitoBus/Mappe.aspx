<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mappe.aspx.cs" Inherits="Mappe" %>

<%@ Register Assembly="GoogleMaps" Namespace="GoogleMaps" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #map {
            height: 100%;
        }
    </style>
    <div class="position-relative p-3 p-md-5 m-md-3 text-center bg-light">
        <div class="col-md-5 p-lg-5 mx-auto my-5 text-center bg-light">
            <asp:Label ID="Label1" runat="server" Text="Mappe Utili" class="display-4 font-weight-normal"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="Localizzazione degli autobus" class="lead font-weight-normal"></asp:Label>
        </div>
    </div>
    <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
        <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white" style="width: 100%;">
            <div class="my-3 py-3">
                <h2 class="display-5">
                    Seleziona il veicolo
                </h2>
                <p class="lead">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control">
                        <asp:ListItem Value="1">Veicolo1</asp:ListItem>
                        <asp:ListItem Value="2">Veicolo2</asp:ListItem>
                    </asp:DropDownList>
                </p>
            </div>
            <div class="bg-light shadow-sm mx-auto text-box" style="width: 100%; height: 100vh -300px; border-radius: 21px 21px 0 0;">
                <div  id="map" style="height:-webkit-fill-available;"></div>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC-g7dwfGYM5MWQ3omgPwKWGF9dztwLV2I&callback=initMap">
    </script>
</asp:Content>
