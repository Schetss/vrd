{*
variables that are available:
- {$item}: contains data about the post
- {$comments}: contains an array with the comments for the post, each element contains data about the comment.
- {$commentsCount}: contains a variable with the number of comments for this blog post.
- {$navigation}: contains an array with data for previous and next post
*}
<div class="row content">
	<article itemscope itemtype="http://schema.org/Blog">
		<meta itemprop="interactionCount" content="UserComments:{$commentsCount}">
		<meta itemprop="author" content="{$item.user_id|usersetting:'nickname'}">
		
		<div itemprop="articlecontent">
			{$item.text}
		</div>
		<footer>
			{option:navigation}
				{option:!navigation.next}
					{option:navigation.previous}
						<a href="{$navigation.previous.url}" rel="prev">{$lblPreviousArticle|ucfirst}: {$navigation.previous.title}</a>
					{/option:navigation.previous}
				{/option:!navigation.next}
				{option:navigation.next}
					<a href="{$navigation.next.url}" rel="next">{$lblNextArticle|ucfirst}: {$navigation.next.title}</a>
				{/option:navigation.next}
			{/option:navigation}
		</footer>
	</article>
</div>