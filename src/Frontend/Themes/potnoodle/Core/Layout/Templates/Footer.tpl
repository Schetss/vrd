<footer class="holder footer-holder">
	<div class="footer row">
		&copy; {$now|date:'Y'} {$siteTitle} opslag &amp; distributie | Jan De Malschelaan 14 | 9140 Temse | T 03/771.09.13 | F 03/771.23.58
	</div>
</footer>

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

{* Site wide HTML *}
{$siteHTMLFooter}
