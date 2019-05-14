<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sito_Bus.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/sito_bus.css"/>
    <title>Sito Autobus</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="site-header sticky-top py-1">
            <div class="container d-flex flex-column flex-md-row justify-content-between">
                <a class="py-2 d-none d-md-inline-block" href="#">Mappe</a>
                <a class="py-2 d-none d-md-inline-block" href="#">Tratte</a>
                <a class="py-2 d-none d-md-inline-block" href="#">Autobus</a>
                <a class="py-2 d-none d-md-inline-block" href="#">Contatti</a>
            </div>
        </div>
        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
            <div class="col-md-5 p-lg-5 mx-auto my-5 text-center bg-light">
                <asp:Label ID="Label1" runat="server" Text="SMG United" class="display-4 font-weight-normal"></asp:Label><br />
                <asp:Label ID="Label2" runat="server" Text="Dove i sogni diventano realtà" class="lead font-weight-normal"></asp:Label>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
