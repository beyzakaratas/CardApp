class EntryValidateMixin {
  String validateIdNumber(String id) {
    if (id.length < 11) {
      return "TC Kimlik numarası 11 haneli olmalıdır.";
    }
  } // dbden gelen tc eslesiyor mu?

  String validatePassword(String password) {
    if (password.length < 4) {
      return "false";
    }
  } // dbden gelen sifre eslesiyor mu?
}