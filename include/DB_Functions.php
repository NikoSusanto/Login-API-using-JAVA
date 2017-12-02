<?php
 
class DB_Functions {
 
    private $conn;
 
    // constructor
    function __construct() {
        require_once 'DB_Connect.php';
        // koneksi ke database
        $db = new Db_Connect();
        $this->conn = $db->connect();
    }
 
    // destructor
    function __destruct() {
         
    }
 
 
    /**
     * Get user berdasarkan email dan password
     */
    public function getUserByEmailAndPassword($email, $password) {
 
		$stmt = $this->conn->prepare("SELECT * FROM User WHERE Email = ?");
		 
				$stmt->bind_param("s", $email);
		 
				if ($stmt->execute()) {
					$user = $stmt->get_result()->fetch_assoc();
					$stmt->close();
		 
					// verifikasi password user
					$pass = $user['Password'];
					// cek password jika sesuai
					if ($pass == $password) {
						// autentikasi user berhasil
						return true;
					}
				} else {
					return false;
        }
    }
	
	/**
     * Get Info setelah verivikasi
     */
    public function getInfo($email) {
 
		$stmt = $this->conn->prepare("SELECT user.Nama_User, rumah.Alamat_Rumah, cluster.Nama_Cluster
		, perumahan.Nama_Perumahan FROM user JOIN rumah ON user.ID_Rumah = rumah.ID_Rumah 
		JOIN cluster ON rumah.ID_Cluster = cluster.ID_Cluster
		JOIN perumahan ON cluster.ID_Perumahan = perumahan.ID_Perumahan WHERE user.Email = ?");
		 
				$stmt->bind_param("s", $email);
		 
					$stmt->execute();
					$user = $stmt->get_result()->fetch_assoc();
					$stmt->close();
		 
					// Simpan info ke variabel
					$nama = $user['Nama_User'];
					$alamat = $user['Alamat_Rumah'];
					$namacluster = $user['Nama_Cluster'];
					$namaperumahan = $user['Nama_Perumahan'];
					// Mengembalikan hasil berupa info
					return array ($nama,$alamat,$namacluster,$namaperumahan);
				
	}
}
 

 
?>