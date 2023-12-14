<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Categories extends CI_Controller
{

	public function sutra()
	{
		$data['title'] = 'Sutra Categories';
		$data['elektronik'] = $this->model_kategori->sutra()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('sutra', $data);
		$this->load->view('layout/home/footer');
	}

	public function eceng()
	{
		$data['title'] = 'Eceng Gondok Categories';
		$data['shirt'] = $this->model_kategori->eceng()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('eceng', $data);
		$this->load->view('layout/home/footer');
	}

	public function Bambu()
	{
		$data['title'] = 'Bambu Categories';
		$data['Bambu'] = $this->model_kategori->Bambu()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('Bambu', $data);
		$this->load->view('layout/home/footer');
	}

	public function Mendong()
	{
		$data['title'] = 'Mendong Categories';
		$data['Mendong'] = $this->model_kategori->Mendong()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('Mendong', $data);
		$this->load->view('layout/home/footer');
	}

	public function Bulu()
	{
		$data['title'] = 'Bulu Categories';
		$data['Bulu'] = $this->model_kategori->Bulu()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('Bulu', $data);
		$this->load->view('layout/home/footer');
	}

	public function Kayu()
	{
		$data['title'] = 'Kayu Categories';
		$data['Kayu'] = $this->model_kategori->Kayu()->result();
		$this->load->view('layout/home/header', $data);
		$this->load->view('Kayu', $data);
		$this->load->view('layout/home/footer');
	}
}
