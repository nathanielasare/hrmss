<?php
class Conf {

	var $smtphost;
	var $dbhost;
	var $dbport;
	var $dbname;
	var $dbuser;
	var $version;

	function Conf() {

		$this->dbhost	= 'localhost';
		$this->dbport 	= '8889';
		if(defined('ENVIRNOMENT') && ENVIRNOMENT == 'test'){
		$this->dbname    = 'test_hrms';		
		}else {
		$this->dbname    = 'hrms';
		}
		$this->dbuser    = 'hrmsadmin';
		$this->dbpass	= 'admin123';
		$this->version = '3.3.3';

		$this->emailConfiguration = dirname(__FILE__).'/mailConf.php';
		$this->errorLog =  realpath(dirname(__FILE__).'/../logs/').'/';
	}
}
?>