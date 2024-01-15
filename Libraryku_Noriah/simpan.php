<?php
include("koneksi.php");

 $judul_buku         = $_POST['judul_buku'];
 $deskripsi            = $_POST['deskripsi'];
 $pengarang           = $_POST['pengarang'];
 $jenis_buku        = $_POST['jenis_buku'];
if (isset($_POST['btn_simpan'])) {

    //Cek apakah ada kiriman form dari method post
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
          
        $ekstensi_diperbolehkan    = array('rar', 'pdf','doc');
        $file = $_FILES['file']['name'];
        $x = explode('.', $file);
        $ekstensi = strtolower(end($x));
        $file_tmp = $_FILES['file']['tmp_name'];

        if (!empty($file)) {
            if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {

                //Mengupload file
                move_uploaded_file($file_tmp, 'asset/buku/' . $file);
                
                $query= "INSERT INTO mdt_buku VALUES('','$judul_buku','$deskripsi','$pengarang','$jenis_buku','1','$file',NOW())";

                $simpan_bank = mysqli_query($koneksi, $query);;

                if ($simpan_bank) {
                    header("Location:admin.php?add=berhasil");
                } else {
                    header("Location:admin.php?add=gagal");
                }
            }
        } else {
            $file = "bank_default.png";
            
        }
    }
}
?>