class AvailableBook {
  AvailableBook({
    required this.idbuku,
    required this.isbn,
    required this.judul,
    required this.idkategori,
    required this.pengarang,
    required this.penerbit,
    required this.kotaTerbit,
    required this.editor,
    required this.fileGambar,
    required this.tglInsert,
    required this.tglUpdate,
    required this.stok,
    required this.stokTersedia,
    required this.idKategori,
    required this.nama,
  });

  String idbuku;
  String isbn;
  String judul;
  String idkategori;
  String pengarang;
  String penerbit;
  String kotaTerbit;
  String editor;
  String fileGambar;
  DateTime tglInsert;
  DateTime tglUpdate;
  String stok;
  String stokTersedia;
  String idKategori;
  String nama;

  factory AvailableBook.fromJson(Map<String, dynamic> json) => AvailableBook(
        idbuku: json["idbuku"],
        isbn: json["isbn"],
        judul: json["judul"],
        idkategori: json["idkategori"],
        pengarang: json["pengarang"],
        penerbit: json["penerbit"],
        kotaTerbit: json["kota_terbit"],
        editor: json["editor"],
        fileGambar: json["file_gambar"],
        tglInsert: DateTime.parse(json["tgl_insert"]),
        tglUpdate: DateTime.parse(json["tgl_update"]),
        stok: json["stok"],
        stokTersedia: json["stok_tersedia"],
        idKategori: json["idKategori"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "idbuku": idbuku,
        "isbn": isbn,
        "judul": judul,
        "idkategori": idkategori,
        "pengarang": pengarang,
        "penerbit": penerbit,
        "kota_terbit": kotaTerbit,
        "editor": editor,
        "file_gambar": fileGambar,
        "tgl_insert":
            "${tglInsert.year.toString().padLeft(4, '0')}-${tglInsert.month.toString().padLeft(2, '0')}-${tglInsert.day.toString().padLeft(2, '0')}",
        "tgl_update":
            "${tglUpdate.year.toString().padLeft(4, '0')}-${tglUpdate.month.toString().padLeft(2, '0')}-${tglUpdate.day.toString().padLeft(2, '0')}",
        "stok": stok,
        "stok_tersedia": stokTersedia,
        "idKategori": idKategori,
        "nama": nama,
      };
}
