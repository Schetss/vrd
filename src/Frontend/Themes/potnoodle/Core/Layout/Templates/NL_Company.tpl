<!DOCTYPE html>
<!--[if IE 7]>         <html lang="{$LANGUAGE}" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="{$LANGUAGE}" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="{$LANGUAGE}" class="no-js"> <!--<![endif]-->

<head>
	{* Meta *}
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="cleartype" content="on">
	<meta name="generator" content="Fork CMS" />
	{$meta}
	{$metaCustom}

	<title>{$pageTitle}</title>

	<!-- Mobile settings http://t.co/dKP3o1e -->
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	{* Stylesheets *}
	<link rel="stylesheet" href="{$SITE_URL}/src/Frontend/Themes/potnoodle/Core/Layout/CSS/screen2.css" />

	{* Favicon *}
	<link rel="icon" href="{$THEME_URL}/favicon.ico" />
	<!--
		Place all other favicons in website root (e.g. http://web.dev/favicon.ico).
		Add your font license here, if necessary.
	-->

	{* Fonts *}

	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700|Merriweather:400,700' rel='stylesheet' type='text/css'>

	{* Windows 8 tile *}
	<meta name="application-name" content="{$siteTitle}"/>
	<meta name="msapplication-TileColor" content="#3380aa"/>
	<meta name="msapplication-TileImage" content="{$THEME_URL}/tile.png"/>

	{* HTML5 shim and Respond.js: "IE8 and below" support of HTML5 elements and media queries *}
	<!--[if lt IE 9  & (!IEMobile)]
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script src="{$THEME_URL}/Core/Js/respond.min.js"></script>
	<![endif]-->

	{* Custom modernizr build: http://modernizr.com *}
	<script src="{$THEME_URL}/Core/Js/modernizr.custom.js"></script>

	{* Site wide HTML *}
	{$siteHTMLHeader}


</head>


<body class="{$LANGUAGE}" class="comp-body" itemscope itemtype="http://schema.org/WebPage">
  <div class="wrapper">	
	  <div class="main">
		<!-- 	{* Header *}
			{include:Core/Layout/Templates/NL_Header.tpl}
		 -->
		<section class="page1">
			<div class="page-container">
				<p> test </p>
			</div>
		</section>

		<section class="page2">
			<div class="page-container">
					<p> test </p>
			</div>
		</section>

		<section class="page3">
			<div class="page-container">
					<p> test </p>
			</div>
		</section>


</div>


<!-- Footer stuff -->

<noscript>
	<div class="holder">
		<div class="row">
			<div class="alert-box notice">
				<h4>{$lblEnableJavascript|ucfirst}</h4>
				<p>{$msgEnableJavascript}</p>
			</div>
		</div>
	</div>
</noscript>

{* General Javascript *}
{iteration:jsFiles}
	<script src="{$jsFiles.file}"></script>
{/iteration:jsFiles}

{* Theme specific Javascript *}
<script src="{$THEME_URL}/Core/Js/theme.js"></script>

	<script>
		 onePageScroll(".main", {
	     sectionContainer: "section",
	     loop: true,
	     responsiveFallback: false
	   });
	</script>

</body>
</html>
