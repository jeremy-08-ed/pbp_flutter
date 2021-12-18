class BorrowedBook {
  BorrowedBook({
    required this.judul,
    required this.pengarang,
    required this.tglPinjam,
    required this.tglKembali,
    required this.totalDenda,
    required this.fileGambar,
  });

  final String judul;
  final String pengarang;
  final DateTime tglPinjam;
  final DateTime tglKembali;
  final String totalDenda;
  final String fileGambar;

  factory BorrowedBook.fromJson(Map<String, dynamic> json) => BorrowedBook(
        judul: json["judul"],
        pengarang: json["pengarang"],
        tglPinjam: DateTime.parse(json["tgl_pinjam"]),
        tglKembali: DateTime.parse(json["tgl_kembali"] ?? DateTime.now()),
        totalDenda: json["total_denda"],
        fileGambar: json["file_gambar"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "pengarang": pengarang,
        "tgl_pinjam":
            "${tglPinjam.year.toString().padLeft(4, '0')}-${tglPinjam.month.toString().padLeft(2, '0')}-${tglPinjam.day.toString().padLeft(2, '0')}",
        "tgl_kembali":
            "${tglKembali.year.toString().padLeft(4, '0')}-${tglKembali.month.toString().padLeft(2, '0')}-${tglKembali.day.toString().padLeft(2, '0')}",
        "total_denda": totalDenda,
        "file_gambar": fileGambar,
      };
}
