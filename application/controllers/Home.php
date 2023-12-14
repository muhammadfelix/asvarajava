<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{

	public function index()
	{
		$data['title'] = 'Shoppify Home';
		$data['product'] = $this->model_pembayaran->get('product')->result();
		$data['collection'] = array(
			'title' => 'My Title',
			'heading' => 'My Heading',
			'message' => 'My Message'
		);
		$this->load->view('layout/home/header', $data);
		$this->load->view('home', $data);
		$this->load->view('layout/home/footer');
	}

	
}
