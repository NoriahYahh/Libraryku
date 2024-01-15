<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 
</head>
<body>
  <!-- Untuk CSS bagian background body nya -->
<style>
  body{
    background-color: pink;
  }
  /* CSS warna untuk Tombol */
  .btn-lgn{
    background-color: #f5ca; }
    .btn-lgn:hover{
    background-color:#ffced9;
  
  }
 </style>
</head>
<body>
  <!-- ini container dari bootstrap untuk membungkus kodingan agar ada padding dan margin-->
    <div class="container">
      <!-- Navbar di mulai -->
    <nav class="navbar navbar-expand-lg " style="background-color: #f5cae6;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Libraryku</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Buku</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
        <a href="login.php" class="btn btn-lgn ms-2" type="submit">Login</a>

      </form>
    </div>
  </div>
</nav>
<!-- end navbar -->
<h1>Buku Bacaan</h1>

<!-- ini untuk navbar buku -->
<table class="table table-bordered table-hover">
  <!--tabel head untuk diatas  -->
<thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Judul buku</th>
      <th scope="col">Deskripsi</th>
      <th scope="col">Pengarang</th>
      <th scope="col">Jenis buku</th>
      <th scope="col">File</th>
      <th scope="col">Action</th>

    </tr>
  </thead>
<!-- isi dari tabel body -->
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
        <td>".$row['file']."</td>
        <td><a href='asset/buku/$row[file]#toolbar=0' target='_blank'>Baca</a>
    </td>
        </tr>"
        ;
        $no++;
    }
    ?>
  </tbody>
</table>
</div>

<!-- pemanggilan java script dari bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>