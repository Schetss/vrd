<?php

namespace Backend\Modules\Contact\Actions;

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

use Backend\Core\Engine\Base\ActionEdit as BackendBaseActionEdit;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Modules\Contact\Engine\Model as BackendContactModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Language as BL;

/**
 * This is the edit-action, it will display a form with the item data to edit
 *
 * @author Jesse Dobbelaere <jesse@dobbelaere-ae.be>
 */
class EditCategory extends BackendBaseActionEdit
{
    /**
     * Execute the action
     */
    public function execute()
    {
        $this->id = $this->getParameter('id', 'int');

        // does the item exist
        if($this->id !== null && BackendContactModel::exists($this->id)) {
            parent::execute();
            $this->getData();
            $this->loadForm();
            $this->validateForm();
            $this->parse();
            $this->display();
        }

        // no item found, throw an exception, because somebody is fucking with our URL
        else $this->redirect(BackendModel::createURLForAction('Index') . '&error=non-existing');
    }

    /**
     * Load the item data
     */
    protected function getData()
    {
        $this->record = BackendContactModel::getCategory($this->id);
    }

    /**
     * Load the form
     */
    protected function loadForm()
    {
        // create form
        $this->frm = new BackendForm('edit');
        $this->frm->addText('title', $this->record['title'], 255, 'inputText title', 'inputTextError title');
    }

    /**
     * Parse the page
     */
    protected function parse()
    {
        parent::parse();

        $this->tpl->assign('item', $this->record);

        // delete allowed?
        $this->tpl->assign('showContactDeleteCategory', BackendContactModel::deleteCategoryAllowed($this->id) && BackendModel::createURLForAction('delete_category'));
    }

    /**
     * Validate the form
     */
    protected function validateForm()
    {
        if($this->frm->isSubmitted()) {
            $this->frm->cleanupFields();

            // validation
            $fields = $this->frm->getFields();
            $fields['title']->isFilled(BL::err('TitleIsRequired'));

            if($this->frm->isCorrect()) {
                $item['id'] = $this->id;
                $item['title'] = $fields['title']->getValue();

                BackendContactModel::updateCategory($item);

                BackendModel::triggerEvent(
                    $this->getModule(), 'after_edit_category', $item
                );

                // everything is saved, so redirect to the overview
                $this->redirect(BackendModel::createURLForAction('Categories') . '&report=edited-category&var=' . urlencode($item['title']) . '&highlight=row-' . $item['id']);
            }
        }
    }
}
