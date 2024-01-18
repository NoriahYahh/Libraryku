<?php 
include("koneksi.php");

$id_laporan =$_GET['id_laporan'];
$query = "DELETE FROM mdt_laporan_ta WHERE id_laporan='$id_laporan'";
mysqli_query($koneksi, $query) ;

header("location:admin.php");
?>