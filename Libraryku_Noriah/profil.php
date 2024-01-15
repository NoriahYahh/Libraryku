<?php
session_start();

if (!isset($_SESSION['username'])) {
    $_SESSION['msg'] = 'Anda harus login untuk mengakses halaman ini';
    header('Location: login.php');
}

include("koneksi.php");

$username_mhs = $_SESSION['username'];
$query = "SELECT mhs.*, prodi.nama_prodi, smt.nama_smt
          FROM mhs
          INNER JOIN prodi ON mhs.id_prodi = prodi.id_prodi
          INNER JOIN smt ON mhs.id_smt = smt.id_smt
          WHERE mhs.username = '$username_mhs'"; // Ganti username dengan sesuai session yang digunakan untuk login

$result = mysqli_query($koneksi, $query);

if (!$result) {
    die("Query Error: " . mysqli_error($koneksi));
}

if (mysqli_num_rows($result) > 0) {
    // Tampilkan data profil mahasiswa
    while ($row = mysqli_fetch_assoc($result)) {
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Libraryku</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <div class="container">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <h1 class="navbar-brand">Libraryku</h1>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="mhs.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="mhs.php/#buku">Buku</a>
        </li> <li class="nav-item">
          <a class="nav-link" href="mhs.php/#laporan">Tugas Akhir</a>
        </li>
        </li> <li class="nav-item">
          <a class="nav-link" href="#">Profil Saya</a>
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
   
        <!-- Navbar end -->
        <div class="">
        <h2>Profil Saya</h2>
            <p><strong>Nama:</strong> <?php echo $row['nama_mhs']; ?></p>
            <p><strong>NIM:</strong> <?php echo $row['nim']; ?></p>
            <p><strong>Program Studi:</strong> <?php echo $row['nama_prodi']; ?></p>
            <p><strong>Semester:</strong> <?php echo $row['nama_smt']; ?></p>
            </div>
    </div>

    <!-- Bootstrap JS, Popper.js, dan jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <!-- ... (Bagian JavaScript setelah Bootstrap) ... -->
</body>

</html>

<?php
    }
} else {
    echo "Data tidak ditemukan";
}

// Tutup koneksi
mysqli_close($koneksi);
?>
