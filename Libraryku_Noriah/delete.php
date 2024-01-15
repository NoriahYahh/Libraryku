<?php 
include("koneksi.php");

$id_buku =$_GET['id_buku'];
$query = "DELETE FROM mdt_buku WHERE id_buku='$id_buku'";
mysqli_query($koneksi, $query) ;

header("location:admin.php");
?>