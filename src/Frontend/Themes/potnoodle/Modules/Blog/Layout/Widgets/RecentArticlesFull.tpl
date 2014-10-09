{*
	variables that are available:
	- {$widgetBlogRecentArticlesFull}: contains an array with all posts, each element contains data about the post
*}

{option:widgetBlogRecentArticlesFull}
	<section>
		{iteration:widgetBlogRecentArticlesFull}
			<article>
				<div class="left">
					<a href="{$widgetBlogRecentArticlesFull.full_url}">
						{option:widgetBlogRecentArticlesFull.image}<img src="{$FRONTEND_FILES_URL}/blog/images/source/{$widgetBlogRecentArticlesFull.image}" alt="{$widgetBlogRecentArticlesFull.title}" />{/option:widgetBlogRecentArticlesFull.image}
					</a>
				</div>

				<div class="right">
					<header>
						<h2><a href="{$widgetBlogRecentArticlesFull.full_url}" title="{$widgetBlogRecentArticlesFull.title}">{$widgetBlogRecentArticlesFull.title}</a></h2>
						<p class="date">
							{$widgetBlogRecentArticlesFull.publish_on|date:{$dateFormatLong}:{$LANGUAGE}}
						</p>
					</header>
					<div>
						{option:!widgetBlogRecentArticlesFull.introduction}{$widgetBlogRecentArticlesFull.text}{/option:!widgetBlogRecentArticlesFull.introduction}
						{option:widgetBlogRecentArticlesFull.introduction}{$widgetBlogRecentArticlesFull.introduction}{/option:widgetBlogRecentArticlesFull.introduction}
						<a class="readmore" href="{$widgetBlogRecentArticlesFull.full_url}">Lees meer</a>
					</div>
				</div>
				<div class="clear"></div>
			</article>
		{/iteration:widgetBlogRecentArticlesFull}
	</section>
{/option:widgetBlogRecentArticlesFull}
