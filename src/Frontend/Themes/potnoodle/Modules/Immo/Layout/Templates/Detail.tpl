<div class="immo immo-detail row content">
	<article>
		<div class="bd">
			<p>{$item.text}</p>


			{option:images}
			<div class="immo-images">
				<!-- <h3>{$lblImages|ucfirst}</h3> -->
				<div class="immo-image-large">
					<img id="immo-preview-image" src="" />
				</div>
				{iteration:images}
				<div class="box" id="{$images.id}">
					<!-- <a class="colorbox" rel="group1" href="{$images.sizes.large}" title="{$images.title}"> -->
						<img src="{$images.sizes.small}" alt="{$images.title}" title="{$images.title}" />
					<!-- </a> -->
				</div>
				{/iteration:images}
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
