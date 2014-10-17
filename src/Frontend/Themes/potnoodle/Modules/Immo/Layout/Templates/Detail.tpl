<div class="immo immo-detail row content">
	<article>
		<div class="bd">
			<p>{$item.text}</p>


			{option:images}
			<div class="immo-images">
				 <div id="immo-slide-holder">
					<div id="immo-slide-runner">
						{iteration:images}
							<img src="{$images.sizes.large}" id="slide-img-{$images.id}" class="slide" alt="{$images.title}" title="{$images.title}" />
						{/iteration:images}
					</div>
				</div>
			</div>
			

			<div class="immo-videos">
				{iteration:videos}
					<a class="fancybox fancybox.iframe" rel="gallery" href="{$videos.url}">
						<img src="{$videos.image}" alt="{$videos.title}" title="{$videos.title}">
					</a>
				{/iteration:videos}
			</div>
			<div class="clear"></div>
			{/option:images}

			<div class="divider"></div>
			{option:related}
                <div class="relatedImmo">
                    <h3>{$lblRelatedImmo|ucfirst}</h3>
                    {iteration:related}
                        <div class="relatedImmo">
                            <small><a href="{$related.url}">{$related.title}</a></small>
                            <a href="{$related.url}">
                                <img src="{$related.image}" alt="{$related.title}" title="{$related.title}" />
                            </a>
                        </div>
                    {/iteration:related}
                </div>
			{/option:related}
		</div>
		<footer>
			<a href="{$var|geturlforblock:'Immo'}" title="{$msgToImmoOverview|ucfirst}">{$msgToImmoOverview|ucfirst}</a>
		</footer>
	</article>
	
</div>
