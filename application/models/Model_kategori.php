<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Model_kategori extends CI_Model
{
	public function sutra()
	{
		return $this->db->get_where('product', array('kategori' => 'Sutra'));
	}

	public function eceng()
	{
		return $this->db->get_where('product', array('kategori' => 'Eceng'));
	}

	public function Bambu()
	{
		return $this->db->get_where('product', array('kategori' => 'Bambu'));
	}

	public function Mendong()
	{
		return $this->db->get_where('product', array('kategori' => 'Mendong'));
	}

	public function Bulu()
	{
		return $this->db->get_where('product', array('kategori' => 'Bulu'));
	}

	public function Kayu()
	{
		return $this->db->get_where('product', array('kategori' => 'Kayu'));
	}
}
