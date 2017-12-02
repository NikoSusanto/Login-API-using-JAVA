<?php
require_once 'include/DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);
$data = json_decode(file_get_contents('php://input'), true);

	$email = $data["email"];
	$password = $data["password"];
	
	//echo $email;
	//echo $password;
	if ($email != null && $password != null) {
	 
		// get the user by email and password
		// get user berdasarkan email dan password
		$user = $db->getUserByEmailAndPassword($email, $password);
		
	 
		if ($user != false) {
			// user ditemukan
			$info = $db->getInfo($email);
			$response["status"] = true;
			$response["message"] = "Ok";
			$response["Name"] = $info[0];
			$response["Email"] = $email;
			$response["Alamat"] = $info[1];
			$response["Nama Cluster"] = $info[2];
			$response["Nama Perumahan"] = $info[3];
			echo json_encode($response);
		} else {
			// user tidak ditemukan password/email salah
			$response["status"] = false;
			$response["message"] = "Unauthorized";
			$response ["title"] = "Login Gagal";
			$response ["message"] = "Email atau password salah";
			echo json_encode($response);
		}
	} else {
		$response["status"] = false;
		$response["message"] = "Unauthorized";
		$response ["title"] = "Login Gagal";
		$response ["message"] = "Email atau password salah";
		echo json_encode($response);
	}
?>