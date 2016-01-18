<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="KO_ERP_Inventory._Default" Theme="AspWidget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>江苏卡欧库存管理与生产过程数据管理软件</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link rel="Stylesheet" type="text/css" href="css_code/Login_SignUp.css" />
    <link rel="shortcut icon" href="Resources/images/GlobalImages/favicon.ico"type="image/x-icon" />
</head>
<body>
    <form id="logInForm" runat="server">
    <div class="login">
        <div class="loginBox">
            <div class="loginBoxMain">
                <ul>
                    <li>
                        <asp:TextBox ID="username" runat="server" BackColor="White" Height="20px" 
                            Width="171px"></asp:TextBox>
                    </li>
                 </ul>
                 <ul>
                    <li>
                        <asp:TextBox ID="password" runat="server" TextMode="Password" BackColor="White" 
                            Height="20px" Width="171px"></asp:TextBox>
                    </li>
                 </ul>
                 <ul>
                    <li style="float:left">
                        <asp:Button ID="login" runat="server" onclick="login_Click" Text="登陆" 
                            Height="25px" Width="70px"   />
                    </li>
                    <li>
                        <asp:Button ID="visitor" runat="server" onclick="visitor_Click" Text="访客" 
                            Height="25px" Width="70px" />
                    </li>
                 </ul>
            </div> 
        </div>
    </div>
    </form>
</body>
</html>
