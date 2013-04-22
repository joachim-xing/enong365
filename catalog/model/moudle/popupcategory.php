<?php
class Modelmoudlepopupcategory extends Model {
	public function getCategories($parent_id = 0,$usecache) {
		
		$sqlstr = "SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)";

		if ($usecache)
		{
			$data = $this->cache->get('popupcategory.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $parent_id);


			if (!$data) { 

				$query = $this->db->query($sqlstr);

				$data = $query->rows;
				
				$this->cache->set('popupcategory.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $parent_id, $data);
			}
			return $data;
		}
		else
		{
			$query = $this->db->query($sqlstr);
			return $query->rows;
		}

		
	}
}
?>