<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainAction.aspx.cs" Inherits="KO_ERP_Inventory.MainAction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>江苏卡欧库存管理与生产过程数据管理软件</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link rel="Stylesheet" type="text/css" href="css_code/mainAction.css" />
</head>
<body>
    <form id="flowchart" runat="server">
    <div class="container">
        <div id="process">
            <ul>
                <li>
                    <a href="asp_code/WMS_QuantityIn.aspx"><img src="Resources/images/LacalImages/Blue_Truck.png" alt="来料" width="128px" height="128px" /></a>
                    <br />元件来料
                </li>
                <li class="arrow">
                    <img src="Resources/images/LacalImages/arrow_next.png" alt="next" width="64px" height="64px" />
                </li>
                <li>
                    <a href="asp_code/WMS_IQC.aspx"><img src="Resources/images/LacalImages/Check_Income.net.png" alt="检测" width="128px" height="128px" /></a>
                    <br />来料检测
                </li>
                <li class="arrow">
                    <img src="Resources/images/LacalImages/arrow_next.png" alt="next" width="64px" height="64px" />
                </li>
                <li>
                    <a href="asp_code/WMS_InStock.aspx"><img src="Resources/images/LacalImages/Store_Cell.png" alt="入库" width="128px" height="128px" /></a>
                    <br />元件入库
                </li>
                <li class="arrow">
                    <img src="Resources/images/LacalImages/arrow_next.png" alt="next" width="64px" height="64px" />
                </li>
                <li>
                    <a href="asp_code/WMS_Picking.aspx"><img src="Resources/images/LacalImages/Pick_Cell.png" alt="领料" width="128px" height="128px" /></a>
                    <br />领料出库
                </li>
            </ul>
        </div>
        <br />
        <div id="sltinfo">
            <ul>
                <li>
                    <a href="#"><img src="Resources/images/LacalImages/Store_Info.png"alt="详情" width="128px" height="128px" /></a>
                    <br />库存明细
                </li>
                <li>
                    <a href="asp_code/SearchStock.aspx"><img src="Resources/images/LacalImages/Store_Search.png"alt="查询" width="128px" height="128px" /></a>
                    <br />库存查询
                </li>
            </ul>
        </div>
    </div>
    </form>
</body>
</html>
