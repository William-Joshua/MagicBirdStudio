<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="topAction.aspx.cs" Inherits="KO_ERP_Inventory.TopAction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>江苏卡欧库存管理与生产过程数据管理软件</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link rel="Stylesheet" type="text/css" href="css_code/topAction.css" />
</head>
<body>
    <form id="topfrm" runat="server">
    <div class="container">
        <img src="Resources/images/GlobalImages/logo.gif" alt="logo" id="logo" style="float:left" />
        
        <div class="userinfo">
            <ul>
                <li>
                    <a id="userimg" href="mainAction.aspx" target="mainLayout" ></a>   
                    <ul>
                        <li>
                            <a>
                                <asp:Label ID="username" runat="server" Text="用户名" Font-Bold="true" Width="72px"></asp:Label>
                            </a>                       
                        </li>
                        <li>
                            <a>
                                <asp:Label ID="userright" runat="server" Text="用户权限" Font-Bold="true" Width="72px"></asp:Label>
                            </a>                          
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="toolbox">
            <ul>
                <li>
                    <a href="mainAction.aspx" target="mainLayout">
                        <img id="homepage" alt="home" src="Resources/images/GlobalImages/home.png" title="主页" width="32px" height="32px" />
                    </a>
                </li>
                <li>
                    <img id="backward" alt="backward" src="Resources/images/GlobalImages/backward.png" width="32px" title="后退" height="32px" onclick="javascript:history.back();"  />
                </li>
                <li>
                    <img id="forward" alt="forward" src="Resources/images/GlobalImages/forward.png" title="前进" width="32px" height="32px" onclick="javascript:history.forward();" />
                </li>
                <li>
                    <a href="home.aspx" target="_top">
                         <img id="refresh" alt="refresh" src="Resources/images/GlobalImages/refresh.png" width="32px" height="32px" title="刷新"/>
                    </a>  
                </li>
                <li>
                    <a href="index.aspx" target="_top">
                        <img src="Resources/images/GlobalImages/exit.png" alt="exit" id="exit" width="32px" height="32px" title="退出" />
                    </a>
                </li>
            </ul>
        </div>
        
    </div>
    </form>
</body>
</html>
