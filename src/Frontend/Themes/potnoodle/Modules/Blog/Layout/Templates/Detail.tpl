{*
variables that are available:
- {$item}: contains data about the post
- {$comments}: contains an array with the comments for the post, each element contains data about the comment.
- {$commentsCount}: contains a variable with the number of comments for this blog post.
- {$navigation}: contains an array with data for previous and next post
*}
<div class="row">
	<article itemscope itemtype="http://schema.org/Blog">
		<meta itemprop="interactionCount" content="UserComments:{$commentsCount}">
		<meta itemprop="author" content="{$item.user_id|usersetting:'nickname'}">
		<header>
			<h2 itemprop="articletitle">{$item.title}</h2>
			<p class="date">
				<time itemprop="datePublished" datetime="{$item.publish_on|date:'Y-m-d\TH:i:s'}">{$item.publish_on|date:{$dateFormatLong}:{$LANGUAGE}}</time>
			</p>
		</header>

		<div itemprop="articlecontent">
			{option:item.image}
				<img src="{$FRONTEND_FILES_URL}/blog/images/source/{$item.image}" alt="{$item.title}" itemprop="image" />
			{/option:item.image}
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