<?php

namespace Backend\Modules\Jobs\Actions;

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

use Backend\Core\Engine\Base\ActionEdit as BackendBaseActionEdit;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Language as BL;
use Backend\Modules\Jobs\Engine\Model as BackendJobsModel;
 
/**
 * This is the edit file action, it will display a form to edit an existing job file.
 *
 * @author Tim van Wolfswinkel <tim@reclame-mediabureau.nl>
 */
class EditFile extends BackendBaseActionEdit
{
	/**
	 * Execute the action
	 */
	public function execute()
	{
		$this->id = $this->getParameter('id', 'int');
		
		if($this->id !== null && BackendJobsModel::existsFile($this->id))
		{
			parent::execute();

			$this->getData();
			$this->loadForm();
			$this->validateForm();
			$this->parse();
			$this->display();
		}
		
		// the item does not exist
		else $this->redirect(BackendModel::createURLForAction('index') . '&error=non-existing');
	}

	/**
	 * Get the data
	 */
	protected function getData()
	{
		$this->job = BackendJobsModel::get($this->getParameter('job_id', 'int'));
		$this->file = BackendJobsModel::getFile($this->getParameter('id', 'int'));
		$this->file['data'] = unserialize($this->record['data']);
		$this->file['link'] = $this->record['data']['link'];
	}

	/**
	 * Load the form
	 */
	protected function loadForm()
	{
		$this->frm = new BackendForm('editFile');
		$this->frm->addText('title', $this->file['title']);
		$this->frm->addFile('file');
	}

	/**
	 * Parse the form
	 */
	protected function parse()
	{
		parent::parse();

		$this->tpl->assign('id', $this->id);
		$this->tpl->assign('item', $this->file);
	}

	/**
	 * Validate the form
	 */
	protected function validateForm()
	{
		// is the form submitted?
		if($this->frm->isSubmitted())
		{
			// cleanup the submitted fields, ignore fields that were added by hackers
			$this->frm->cleanupFields();

			// validate fields
            $file = $this->frm->getField('file');

			$this->frm->getField('title')->isFilled(BL::err('NameIsRequired'));
			if($this->file['filename'] === null) $file->isFilled(BL::err('FieldIsRequired'));
                        
			// no errors?
			if($this->frm->isCorrect())
			{
				// build image record to insert
				$item['id'] = $this->id;
				$item['title'] = $this->frm->getField('title')->getValue();
				$item['filename'] = $this->file['filename'];
								
				// the file path
				$filePath = FRONTEND_FILES_PATH . '/' . $this->getModule() . '/' . $this->job['id'] . '/source';
				
				if($file->isFilled())
				{
					// overwrite the filename
					if($item['filename'] === null)
					{
						$item['filename'] = time() . '.' . $file->getExtension();
					}

					$file->moveFile($filePath . '/' . $item['filename']);
				}
				
				// save the item
				$id = BackendJobsModel::saveFile($item);

				// trigger event
				BackendModel::triggerEvent($this->getModule(), 'after_edit_file', array('item' => $item));
								
				// everything is saved, so redirect to the overview
				$this->redirect(BackendModel::createURLForAction('media') . '&job_id=' . $this->job['id'] . '&report=edited&var=' . urlencode($item['title']) . '&highlight=row-' . $item['id']);
			}
		}
	}
}
