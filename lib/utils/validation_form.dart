
class ValidationForm  {
  // FUNGSI validatePassword > NAMA FUNGSI BEBAS
  String validatePassword(String value) { //MENERIMA VALUE DENGAN TYPE STRING
    if (value.length < 4) { //VALUE TERSEBUT DI CEK APABILA KURANG DARI 6 KARAKTER
      return 'Password Minimal 4 Karakter'; //MAKA ERROR AKAN DITAMPILKAN
    }
    return null; //SELAIN ITU LOLOS VALIDASI
  }

  String validateEmail(String value) {
    if (!value.contains('@')) { //JIKA VALUE MENGANDUNG KARAKTER @
      return 'Email tidak valid'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }

  String validateName(String value) {
    if (value.isEmpty) { //JIKA VALUE KOSONG
      return 'Tidak Boleh Kosong'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }

}