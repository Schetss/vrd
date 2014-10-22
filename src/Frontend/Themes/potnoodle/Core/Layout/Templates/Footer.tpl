<footer class="holder footer-holder">
	<div class="footer row">
		&copy; {$now|date:'Y'} {$siteTitle} opslag &amp; distributie | <span class="nowrap">Jan De Malschelaan 14</span> | <span class="nowrap">9140 Temse</span> | <span class="nowrap">T 03/771.09.13</span> | <span class="nowrap">F 03/771.23.58</span>
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
<!-- <script defer src="{$THEME_URL}/Core/Js/jquery.flexslider.js"></script> -->

<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script> window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
<script defer src="../jquery.flexslider.js"></script>


{* Site wide HTML *}
{$siteHTMLFooter}
