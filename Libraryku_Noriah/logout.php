<?php
//inisialisasi session
    session_start();
    //menghapus session
    if(session_destroy()) {
         //jika berhasil maka akan diredirect ke file index.php
        header("Location: index.php");
    }
?>