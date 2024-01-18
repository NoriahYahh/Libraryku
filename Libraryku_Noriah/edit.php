<?php
    include 'koneksi.php';
    // Menyimpan data kedalam variable
    $id_buku        = $_POST['id_buku'];
    $judul_buku     = $_POST['judul_buku'];
    $deskripsi      = $_POST['deskripsi'];
    $pengarang      = $_POST['pengarang'];
    $jenis_buku     = $_POST['jenis_buku'];

    
$query="UPDATE mdt_buku SET judul_buku='$judul_buku',deskripsi='$deskripsi',pengarang='$pengarang', jenis_buku='$jenis_buku' where id_buku='$id_buku'";
    mysqli_query($koneksi,$query);
    header("location:admin.php");


    
    ?>