enum Chapter {
  khaiNiemVaQuyTac(1, 'Khái niệm và quy tắc'),
  nghiepVuVanTai(2, 'Nghiệp vụ vận tải'),
  vanHoaVaDaoDuc(3, 'Văn hóa và đạo đức'),
  kyThuatLaiXe(4, 'Kỹ thuật lái xe'),
  cauTaoVaSuaChua(5, 'Cấu tạo và sửa chữa'),
  bienBaoDuongBo(6, 'Biển báo đường bộ'),
  saHinhVaTinhHuong(7, 'Sa hình và tình huống');

  const Chapter(this.chapterDbIndex, this.chapterName);
  final int chapterDbIndex;
  final String chapterName;
}
