{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
	<h2>{$lblImmo|ucfirst}: {$lblEditVideo}</h2>
</div>

{form:editVideo}
	<div class="tabs">
		<ul>
			<li><a href="#tabContent">{$lblContent|ucfirst}</a></li>
		</ul>

		<div id="tabContent">
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td id="leftColumn">
						<div class="box">
							<div class="heading">
								<h3>{$lblTitle|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></h3>
							</div>
							<div class="options">
								{$txtTitle} {$txtTitleError}
							</div>
						</div>

						<div class="box">
							<div class="heading">
								<h3>{$lblVideo|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></h3>
							</div>
							<div class="options">
								<label for="image">{$lblEmbeddedUrl|ucfirst}</label>
								{$txtVideo} {$txtVideoError}
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="fullwidthOptions">
		{option:showImmoMedia}
		<a href="{$var|geturl:'media'}&immo_id={$item.immo_id}" class="button">
			<span>{$lblBackToOverview|ucfirst}</span>
		</a>
		{/option:showImmoMedia}

		<div class="buttonHolderRight">
			<input id="editButton" class="inputButton button mainButton" type="submit" name="edit" value="{$lblSave|ucfirst}" />
		</div>
	</div>
{/form:editVideo}

{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}