<?php

namespace Backend\Modules\Projects\Actions;

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

use Backend\Core\Engine\Base\ActionEdit as BackendBaseActionEdit;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Meta as BackendMeta;
use Backend\Core\Engine\Authentication as BackendAuthentication;
use Backend\Core\Engine\Language as BL;
use Backend\Modules\Projects\Engine\Model as BackendProjectsModel;

/**
 * This is the edit category action, it will display a form to edit an existing category.
 *
 * @author Bart De Clercq <info@lexxweb.be>
 * @author Tim van Wolfswinkel <tim@webleads.nl>
 */
class EditCategory extends BackendBaseActionEdit
{
	/**
	 * Execute the action
	 */
	public function execute()
	{
		$this->id = $this->getParameter('id', 'int');
		
		// does the item exist?
		if($this->id !== null && BackendProjectsModel::existsCategory($this->id))
		{
			parent::execute();

			$this->getData();
			$this->loadForm();
			$this->validateForm();

			$this->parse();
			$this->display();
		}
		else $this->redirect(BackendModel::createURLForAction('categories') . '&error=non-existing');
	}

	/**
	 * Get the data
	 */
	private function getData()
	{
		$this->record = BackendProjectsModel::getCategory($this->id);
	}

	/**
	 * Load the form
	 */
	private function loadForm()
	{
		// create form
		$this->frm = new BackendForm('editCategory');
		$this->frm->addText('title', $this->record['title']);

		$this->meta = new BackendMeta($this->frm, $this->record['meta_id'], 'title', true);
	}

	/**
	 * Parse the form
	 */
	protected function parse()
	{
		parent::parse();

		// assign the data
		$this->tpl->assign('item', $this->record);
		$this->tpl->assign('showProjectsDeleteCategory', BackendProjectsModel::deleteCategoryAllowed($this->id) && BackendAuthentication::isAllowedAction('delete_category'));
	}

	/**
	 * Validate the form
	 */
	private function validateForm()
	{
		if($this->frm->isSubmitted())
		{
			$this->meta->setUrlCallback('Backend\Modules\Projects\Engine\Model', 'getURLForCategory', array($this->record['id']));

			$this->frm->cleanupFields();

			// validate fields
			$this->frm->getField('title')->isFilled(BL::err('TitleIsRequired'));
			$this->meta->validate();

			if($this->frm->isCorrect())
			{
				// build item
				$item['id'] = $this->id;
				$item['language'] = $this->record['language'];
				$item['title'] = $this->frm->getField('title')->getValue();
				$item['extra_id'] = $this->record['extra_id'];
				$item['meta_id'] = $this->meta->save(true);

				// update the item
				BackendProjectsModel::updateCategory($item);
				BackendModel::triggerEvent($this->getModule(), 'after_edit_category', array('item' => $item));

				// everything is saved, so redirect to the overview
				$this->redirect(BackendModel::createURLForAction('categories') . '&report=edited-category&var=' . urlencode($item['title']) . '&highlight=row-' . $item['id']);
			}
		}
	}
}
