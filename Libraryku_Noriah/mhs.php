<!DOCTYPE html>
<?php
session_start();

if (!isset($_SESSION['username'])){
  $_SESSION['msg'] = 'anda harus login agar dapat mengakses halaman ini';
  header('Location: login.php');
}
include("koneksi.php");
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 <style>
  body{
    background-color: pink;
  }
 </style>
</head>
<body>
  
    <div class="container">
    <nav class="navbar navbar-expand-lg sticky-top "style="background-color: #f5cae6;">
  <div class="container-fluid">
    <h1 class="navbar-brand">Libraryku</h1>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#buku">Buku</a>
        </li> <li class="nav-item">
          <a class="nav-link" href="#laporan">Tugas Akhir</a>
        </li>
        </li> <li class="nav-item">
          <a class="nav-link" href="profil.php">Profil Saya</a>
        </li>
        
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
        <a class="btn btn-outline-danger ms-2" type="submit" href="logout.php">Logout</a>
      </form>
    </div>
  </div>
</nav>
    
<!-- end navbar -->
<h1 id="buku">Buku Bacaan</h1>

<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Judul buku</th>
      <th scope="col">Deskripsi</th>
      <th scope="col">Pengarang</th>
      <th scope="col">Jenis buku</th>
      <th scope="col">Action</th>

    </tr>
  </thead>
  <tbody>
  <?php
    include'koneksi.php';
    $buku = mysqli_query($koneksi, "SELECT * from mdt_buku");
    $no = 1 ;
    foreach ($buku as $row){
        echo "<tr>
        <td>$no</td>
        <td>".$row['judul_buku']."</td>
        <td>".$row['deskripsi']."</td>
        <td>".$row['pengarang']."</td>
        <td>".$row['jenis_buku']."</td>
        

        <td>
        <a href='asset/buku/$row[file]#toolbar=0' target='_blank'>Baca</a>
        <a href='asset/buku/$row[file]' type='button' download='asset/buku/$row[file]'>Download</a>
    </td>
        </tr>"
        ;
        $no++;
    }
    ?>
  </tbody>
</table>


<h1 id="laporan">Laporan TA</h1>
<?php
$username_mhs=$_SESSION['username'];

$query_into_mhs="SELECT * FROM mhs WHERE username='$username_mhs'";
$result_into_mhs=mysqli_query($koneksi, $query_into_mhs);

if ($result_into_mhs){
  $data_mhs=mysqli_fetch_assoc($result_into_mhs);

  //Cek apakah mahasiswa adalah semester 6
  if ($data_mhs['id_smt'] >=6) {
    //Semester 6, Tampilkan tombol Upload//
    echo '<a href="form-mhs-inp.php" id="tambah" type="button" class="btn btn-primary">Input TA</a>';
  }
}
?>
<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Judul TA</th>
      <th scope="col">Abstrak</th>
      <th scope="col">Nama</th>
      <th scope="col">Prodi</th>
      <th scope="col">File</th>
      <th scope="col">Status</th>
      <th scope="col">Tanggal dimasukkan</th>
      <th scope="col">Action</th>
      

    </tr>
  </thead>
  <tbody>
  <?php
    include'koneksi.php';
    $ta = mysqli_query($koneksi, "SELECT mdt_laporan_ta.*, mhs.nama_mhs, prodi.nama_prodi 
    FROM mdt_laporan_ta
    INNER JOIN mhs ON mdt_laporan_ta.nim = mhs.nim
    INNER JOIN prodi ON mdt_laporan_ta.id_prodi = prodi.id_prodi");


    $no = 1 ;
    foreach ($ta as $data){
        echo "<tr>
        <td>$no</td>
        <td>".$data['judul_laporan']."</td>
        <td>".$data['abstrak']."</td>
        <td>".$data['nama_mhs']."</td>
        <td>".$data['nama_prodi']."</td>
        <td>".$data['file']."</td>

        <td>".$data['status']."</td>
        <td>".$data['create_date']."</td>
        <td><a href='asset/buku/$data[file]#toolbar=0' target='_blank'>Baca</a>
        </tr>"
        ;
        $no++;
    }
    ?>
  </tbody>
</table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>