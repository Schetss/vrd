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
		{option:navigation}
			{option:navigation.next}
				<footer>	
					<a href="{$navigation.next.url}" rel="next">{$lblNextArticle|ucfirst}: {$navigation.next.title}</a>
				</footer>
			{/option:navigation.next}
		{/option:navigation}
	</article>
</div>