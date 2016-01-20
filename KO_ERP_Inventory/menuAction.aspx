<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menuAction.aspx.cs" Inherits="KO_ERP_Inventory.MenuAction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>江苏卡欧库存管理与生产过程数据管理软件</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link rel="Stylesheet" type="text/css" href="css_code/menuAction.css" />
</head>
<body id="bg">

<div class="container">

	<div class="leftsidebar_box">
		<div class="line"></div>
		<dl class="custom">
			<dt>库存管理<img src="Resources/images/left/select_xl01.png" alt="select_xl01" /></dt>
			<dd><a href="asp_code/WMS_QuantityIn.aspx" target="mainLayout">元件来料</a></dd>
			<dd><a href="asp_code/WMS_IQC.aspx" target="mainLayout">来料检测</a></dd>
			<dd><a href="asp_code/WMS_InStock.aspx" target="mainLayout">元件入库</a></dd>
			<dd><a href="asp_code/WMS_Picking.aspx" target="mainLayout">领料出库</a></dd>
			<dd><a href="asp_code/SearchStock.aspx"target="mainLayout">库存查询</a></dd>
		</dl>
	
		<dl class="source">
			<dt>清单管理<img src="Resources/images/left/select_xl01.png" alt="select_xl02" /></dt>
			<dd><a href="#" target="mainLayout">生产合同</a></dd>
			<dd><a href="#" target="mainLayout">来料订单</a></dd>
			<dd><a href="#" target="mainLayout">生产计划清单</a></dd>
			<dd><a href="#" target="mainLayout">测试报告</a></dd>
			<dd><a href="#" target="mainLayout">领料单</a></dd>
		</dl>
	
		<dl class="syetem_management">
			<dt>系统管理<img src="Resources/images/left/select_xl01.png" alt="select_xl03" /></dt>
			<dd><a href="#" target="mainLayout">账号管理</a></dd>
		</dl>
	
		<dl class="statistics">
			<dt>其他<img src="Resources/images/left/select_xl01.png" alt="select_xl04" /></dt>
			<dd><a href="#" target="mainLayout">器件类型</a></dd>
			<dd><a href="#" target="mainLayout">报告模板</a></dd>
			<dd><a href="#" target="mainLayout">用户说明</a></dd>
			<dd><a href="#" target="mainLayout">仓库地图</a></dd>
		</dl>
	</div>
</div>

<script type="text/javascript" src="js_code/menuAction.js"></script>
<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-color":"#3992d0"});
$(".leftsidebar_box dt img").attr("src","Resources/images/left/select_xl01.png");
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		$(".leftsidebar_box dt").css({"background-color":"#3992d0"})
		$(this).css({"background-color": "#317eb4"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src","Resources/images/left/select_xl01.png");
		$(this).parent().find('img').attr("src","Resources/images/left/select_xl.png");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
})
</script>
</body>
</html>
