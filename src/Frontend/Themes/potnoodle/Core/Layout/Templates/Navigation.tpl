{option:navigation}
	<ul>
		{iteration:navigation}
			<li{option:navigation.selected} class="selected"{/option:navigation.selected}>
				<a href="{$navigation.link}" title="{$navigation.navigation_title}"{option:navigation.nofollow} rel="nofollow"{/option:navigation.nofollow}>{$navigation.navigation_title}</a>
				{option:navigation.selected}{$navigation.children}{/option:navigation.selected}
			</li>
		{/iteration:navigation}
    </ul>
    <ul class="main-nav-extra">
        <li>
            <a href="http://klanten.vrd.be" target="_blank">Klanten login</a>
        </li>
    </ul>
{/option:navigation}