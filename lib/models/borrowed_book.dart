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
  final String tglKembali;
  final String totalDenda;
  final String fileGambar;

  factory BorrowedBook.fromJson(Map<String, dynamic> json) => BorrowedBook(
        judul: json["judul"],
        pengarang: json["pengarang"],
        tglPinjam: DateTime.parse(json["tgl_pinjam"]),
        tglKembali: json["tgl_kembali"] ?? "",
        totalDenda: json["total_denda"],
        fileGambar: json["file_gambar"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "pengarang": pengarang,
        "tgl_pinjam":
            "${tglPinjam.year.toString().padLeft(4, '0')}-${tglPinjam.month.toString().padLeft(2, '0')}-${tglPinjam.day.toString().padLeft(2, '0')}",
        "tgl_kembali": tglKembali,
        "total_denda": totalDenda,
        "file_gambar": fileGambar,
      };
}
