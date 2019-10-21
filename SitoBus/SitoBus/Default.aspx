<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SitoBus._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="position-relative p-3 p-md-5 m-md-3 text-center bg-light">
        <div class="col-md-5 p-lg-5 mx-auto my-5 text-center bg-light">
            <asp:Label ID="Label1" runat="server" Text="FMG United" class="display-4 font-weight-normal"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="Dove i sogni diventano realtà" class="lead font-weight-normal"></asp:Label>
        </div>
    </div>
    <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
        <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white div-msg">
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

</asp:Content>
