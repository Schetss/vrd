<?php

namespace Backend\Modules\Immo\Actions;

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

use Backend\Core\Engine\Base\ActionIndex as BackendBaseActionIndex;
use Backend\Core\Engine\Language as BL;
use Backend\Core\Engine\Authentication as BackendAuthentication;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\DataGridDB as BackendDataGridDB;
use Backend\Core\Engine\DataGridFunctions as BackendDataGridFunctions;
use Backend\Modules\Immo\Engine\Model as BackendImmoModel;
 
/**
 * This is the categories action, it will display the overview of immo categories.
 *
 * @author Bart De Clercq <info@lexxweb.be>
 * @author Tim van Wolfswinkel <tim@webleads.nl>
 */
class Categories extends BackendBaseActionIndex
{
	/**
	 * Deny the use of multiple categories
	 *
	 * @param bool
	 */
	private $multipleCategoriesAllowed;

	/**
	 * Execute the action
	 */
	public function execute()
	{
		parent::execute();

		$this->loadDataGrid();

		$this->parse();
		$this->display();
	}

	/**
	 * Loads the dataGrid
	 */
	private function loadDataGrid()
	{
		// are multiple categories allowed?
		$this->multipleCategoriesAllowed = BackendModel::getModuleSetting('immo', 'allow_multiple_categories', true);

		// create dataGrid
		$this->dataGrid = new BackendDataGridDB(BackendImmoModel::QRY_DATAGRID_BROWSE_CATEGORIES, BL::getWorkingLanguage());
		$this->dataGrid->setHeaderLabels(array('num_items' => ucfirst(BL::lbl('Amount'))));
		if($this->multipleCategoriesAllowed) $this->dataGrid->enableSequenceByDragAndDrop();
		else $this->dataGrid->setColumnsHidden(array('sequence'));
		$this->dataGrid->setRowAttributes(array('id' => '[id]'));
		$this->dataGrid->setPaging(false);

		// check if this action is allowed
		if(BackendAuthentication::isAllowedAction('index'))
		{
			$this->dataGrid->setColumnFunction(array(__CLASS__, 'setClickableCount'), array('[num_items]', BackendModel::createURLForAction('index') . '&amp;category=[id]'), 'num_items', true);
		}

		// check if this action is allowed
		if(BackendAuthentication::isAllowedAction('edit_category'))
		{
			$this->dataGrid->setColumnURL('title', BackendModel::createURLForAction('edit_category') . '&amp;id=[id]');
			$this->dataGrid->addColumn('edit', null, BL::lbl('Edit'), BackendModel::createURLForAction('edit_category') . '&amp;id=[id]', BL::lbl('Edit'));
		}
	}

	/**
	 * Parse & display the page
	 */
	protected function parse()
	{
		parent::parse();

		$this->tpl->assign('dataGrid', ($this->dataGrid->getNumResults() != 0) ? $this->dataGrid->getContent() : false);

		// check if this action is allowed
		if(BackendAuthentication::isAllowedAction('add_category') && $this->multipleCategoriesAllowed)
		{
			$this->tpl->assign('showImmoAddCategory', true);
		}
		else $this->tpl->assign('showImmoAddCategory', false);
	}

	/**
	 * Convert the count in a human readable one.
	 *
	 * @param int $count
	 * @param string $link
	 * @return string
	 */
	public static function setClickableCount($count, $link)
	{
		// redefine
		$count = (int) $count;
		$link = (string) $link;

		// return link in case of more than one item, one item, other
		if($count > 1) return '<a href="' . $link . '">' . $count . ' ' . BL::getLabel('Immo') . '</a>';
		if($count == 1) return '<a href="' . $link . '">' . $count . ' ' . BL::getLabel('Immo') . '</a>';
		else return BL::getLabel('NoImmo');
	}
}
