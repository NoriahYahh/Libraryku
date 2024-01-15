<!DOCTYPE html>
<?php
session_start();

if (!isset($_SESSION['username'])){
  $_SESSION['msg'] = 'anda harus login agar dapat mengakses halaman ini';
  header('Location: login.php');
}
include("koneksi.php");
$id_buku        = $_GET['id_buku'];
$buku    = mysqli_query($koneksi, "select * from mdt_buku where id_buku='$id_buku'");
$row     = mysqli_fetch_array($buku);
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <me<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 
</head>
<body>
    <div class="container">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<!-- end navbar -->
 
<form action="edit.php" method="post">
<input type="hidden" value="<?php echo $row['id_buku']; ?>" name="id_buku">    
<div class="mb-3">
      <label for="judul_buku" class="form-label">Judul buku</label>
      <input value="<?php echo $row['judul_buku']; ?>" type="text" id="judul_buku" class="form-control" name="judul_buku">

    </div>
    <div class="mb-3">
      <label for="deskripsi" class="form-label">Deskripsi</label>
      <input value="<?php echo $row['deskripsi']; ?>" type="text" id="deskripsi" class="form-control" name="deskripsi">
    </div>
    <div class="mb-3">
      <label for="pengarang" class="form-label">Pengarang</label>
      <input value="<?php echo $row['pengarang']; ?>" type="text" id="pengarang" class="form-control" name="pengarang">
    </div>
  
    <div class="mb-3">
      <label for="jenis_buku" class="form-label">Jenis buku</label>
      <select value="<?php echo $row['jenis_buku']; ?>" id="jenis_buku" class="form-select" name="jenis_buku">
        <option value="Buku Bacaan">Buku Bacaan</option>
        <option value="Buku Ajar(Diktat)">Buku Ajar (Diktat)</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="file" class="form-label">Upload file</label>
      <input type="file" id="file" class="form-control" name="file" accept=".pdf">
      <small class="text-muted">File saat ini: <?php echo $row['file']; ?></small>
    </div>
    <button type="submit" class="btn btn-primary" value="simpan" name="btn_simpan">Submit</button>
</form>
</div>
</body>
</html>