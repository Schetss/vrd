{include:Core/Layout/Templates/Head.tpl}

<body class="{$LANGUAGE}" itemscope itemtype="http://schema.org/WebPage">
	<!--[if lt IE 8]>
		<div class="alert-box">
			<p>You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser to improve your experience.</p>
		</div>
	<![endif]-->

	{* Header *}
	{include:Core/Layout/Templates/Header.tpl}

	<main id="main" class="holder main-holder" role="main">
		<div class="main-header">
			<div class="main-header-image">
				{* Image position *}
				{option:positionImage}
					{iteration:positionImage}
					{option:!positionImage.blockIsHTML}
						{$positionImage.blockContent}
					{/option:!positionImage.blockIsHTML}
					{option:positionImage.blockIsHTML}
						{$positionImage.blockContent}
					{/option:positionImage.blockIsHTML}
					{/iteration:positionImage}
				{/option:positionImage}
			</div>	
			<div class="image-overlay"></div>
			
			<nav id="selector2">
				<ul>
					<li>
						<a href="/nl/het-bedrijf/distributie">Distributie</a>
					</li>
					<li>
						<a href="/nl/het-bedrijf/transport">Transport</a>
					</li>
					<li>
						<a href="/nl/het-bedrijf/opslag-fijnpikking">Opslag &amp; fijnpicking</a>
					</li>
					<li>
						<a href="/nl/het-bedrijf/immo">Immo</a>
					</li>
				</ul>
			</nav>

			<div class="row main-header-title">
				{* Page title *}
				{option:!hideContentTitle}
					<header>
						<!-- <h1>{$page.title}</h1> -->
					</header>
				{/option:!hideContentTitle}
			</div>
		</div>

		<div class="bluebox2 row">
			{* Bluebox position *}
			{option:positionBluebox}
				{iteration:positionBluebox}
				{option:!positionBluebox.blockIsHTML}
					{$positionBluebox.blockContent}
				{/option:!positionBluebox.blockIsHTML}
				{option:positionBluebox.blockIsHTML}
					{$positionBluebox.blockContent}
				{/option:positionBluebox.blockIsHTML}
				{/iteration:positionBluebox}
			{/option:positionBluebox}
		</div>
			<div class="main main-text">
				{* Main position *}
				{option:positionMain}
					{iteration:positionMain}
					{option:!positionMain.blockIsHTML}
						{$positionMain.blockContent}
					{/option:!positionMain.blockIsHTML}
					{option:positionMain.blockIsHTML}
						{$positionMain.blockContent}
					{/option:positionMain.blockIsHTML}
					{/iteration:positionMain}
				{/option:positionMain}
			</div>
	</main>

	{* Footer *}
	{include:Core/Layout/Templates/Footer.tpl}

</body>
</html>
