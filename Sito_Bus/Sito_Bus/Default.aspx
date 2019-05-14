<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sito_Bus.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/sito_bus.css" />
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
                <asp:Label ID="Label1" runat="server" Text="FMG United" class="display-4 font-weight-normal"></asp:Label><br />
                <asp:Label ID="Label2" runat="server" Text="Dove i sogni diventano realtà" class="lead font-weight-normal"></asp:Label>
            </div>
        </div>
        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden div-msg">
                <div class="my-3 py-3">
                    <h2 class="display-5">Presentazione del progetto</h2>
                    <p class="lead">Chi è FMG e cosa ha Fatto?</p>
                </div>
                <div class="bg-light shadow-sm mx-auto text-box" style="width: 80%; border-radius: 21px 21px 0 0;">
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                    a<br />
                </div>
            </div>
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden div-login">
                <div class="my-3 p-3">
                    <h2 class="display-5">Login</h2>
                </div>
                <div class="bg-dark shadow-sm mx-auto div-login-dark" style="width: 80%; height: 300px;">
                    <div class="login-area">
                        <label for="inputEmail" class="sr-only">Email address</label>
                        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="" />
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="" />
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
