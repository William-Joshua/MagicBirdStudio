<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="KO_ERP_Inventory.home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>江苏卡欧库存管理与生产过程数据管理软件</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link rel="Stylesheet" type="text/css" href="css_code/Login_SignUp.css" />
    <link rel="shortcut icon" href="Resources/images/GlobalImages/favicon.ico"type="image/x-icon" /> 
</head>
<frameset rows="60,*" cols="*">
    <noframes>
        <body style="background-color: #233041;">
            <div class="wrap">
                <img src="Resources/images/GlobalImages/noframe.png" alt="NoFrame" height="120px" width="120px" />
                <div id="error">
                    <p>浏览器兼容性错误</p>
                    <p>您的浏览器不支持框架</p>
                </div>
            </div>
        </body>
    </noframes>
    <frame src="topAction.aspx" name="topLayout" scrolling="no" noresize="noresize" />
    <frameset cols="160,*">
        <frame src="menuAction.aspx" name="menuLayout" scrolling="yes" noresize="noresize" />
        <frame src="mainAction.aspx" name="mainLayout" scrolling="yes" />
    </frameset>
</frameset>

</html>
