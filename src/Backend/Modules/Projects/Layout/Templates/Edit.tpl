{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}

<div class="pageTitle">
	<h2>{$lblProjects|ucfirst}: {$msgEditProject|sprintf:{$item.title}}</h2>
</div>

{form:edit}

	<label for="title">{$lblProject|ucfirst}</label>
	{$txtTitle} {$txtTitleError}

	<div id="pageUrl">
		<div class="oneLiner">
			{option:detailURL}<p><span><a href="{$detailURL}/{$item.url}">{$detailURL}/<span id="generatedUrl">{$item.url}</span></a></span></p>{/option:detailURL}
			{option:!detailURL}<p class="infoMessage">{$errNoModuleLinked}</p>{/option:!detailURL}
		</div>
	</div>

	<div class="tabs">
		<ul>
			<li><a href="#tabContent">{$lblContent|ucfirst}</a></li>
			<li><a href="#tabSEO">{$lblSEO|ucfirst}</a></li>
		</ul>

		<div id="tabContent">
			<table width="100%">
				<tr>
					<td id="leftColumn">
						<div class="box">
							<div class="heading">
								<h3>
									<label for="introduction">{$lblSummary|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></label>
								</h3>
							</div>
							<div class="optionsRTE">
								{$txtIntroduction} {$txtIntroductionError}
							</div>
						</div>
						<div class="box">
							<div class="heading">
								<h3>
									<label for="text">{$lblMainContent|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></label>
								</h3>
							</div>
							<div class="optionsRTE">
								{$txtText} {$txtTextError}
							</div>
						</div>
					</td>

					<td id="sidebar">
						<div id="publishOptions" class="box">
							<div class="heading">
								<h3>{$lblStatus|ucfirst}</h3>
							</div>

							<div class="options">
								<ul class="inputList">
									{iteration:hidden}
									<li>
										{$hidden.rbtHidden}
										<label for="{$hidden.id}">{$hidden.label}</label>
									</li>
									{/iteration:hidden}
								</ul>
							</div>
						</div>

						<div class="box" id="articleMeta">
							<div class="heading">
								<h3>{$lblMetaData|ucfirst}</h3>
							</div>
							
							<div class="options">
								<label for="dateTime">{$lblDate|ucfirst}</label>
									<p>{$txtDateDate} {$txtDateDateError}</p>
							</div>
							
							<div class="options">
								<label for="categoryId">{$lblCategory|ucfirst}</label>
								{$ddmCategoryId} {$ddmCategoryIdError}
							</div>
							
							<div class="options">
								<label for="clientId">{$lblClient|ucfirst}</label>
								{$ddmClientId} {$ddmClientIdError}
							</div>
							
							<div class="options">
								<label for="tags">{$lblTags|ucfirst}</label>
								{$txtTags} {$txtTagsError}
							</div>
						</div>
						
						<div id="publishOptions" class="box">
							<div class="heading">
								<h3>{$lblSpotlight|ucfirst}</h3>
							</div>
							<div class="options">
								<ul class="inputList">
									<li>
										{$chkSpotlight}
										<label for="spotlight">{$msgSpotlight}</label>
									</li>
								</ul>
							</div>
						</div>
						
						<div id="publishOptions" class="box">
							<div class="heading">
								<h3>{$lblRelatedProjects|ucfirst}</h3>
							</div>
							<div class="options">
								<label for="spotlight">{$msgRelatedProjects}</label></br>
								{$ddmRelatedProjects} {$ddmRelatedProjectsError}
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>

		<div id="tabSEO">
			{include:{$BACKEND_CORE_PATH}/layout/templates/seo.tpl}
		</div>
	</div>

	<div class="fullwidthOptions">
		{option:showProjectsDelete}
		<a href="{$var|geturl:'delete'}&amp;id={$item.id}" data-message-id="confirmDelete" class="askConfirmation button linkButton icon iconDelete">
			<span>{$lblDelete|ucfirst}</span>
		</a>
		{/option:showProjectsDelete}

		<div class="buttonHolderRight">
			<input id="editButton" class="inputButton button mainButton" type="submit" name="edit" value="{$lblPublish|ucfirst}" />
		</div>
	</div>

	<div id="confirmDelete" title="{$lblDelete|ucfirst}?" style="display: none;">
		<p>
			{$msgConfirmDelete|sprintf:{$item.title}}
		</p>
	</div>
{/form:edit}

{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}