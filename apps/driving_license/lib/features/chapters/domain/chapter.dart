enum Chapter {
  khaiNiemVaQuyTac(
    1,
    'Khái niệm và quy tắc',
    'assets/icons/home_screen/complied/books.svg.vec',
  ),
  nghiepVuVanTai(
    2,
    'Nghiệp vụ vận tải',
    'assets/icons/home_screen/complied/danger_fire.svg.vec',
  ),
  vanHoaVaDaoDuc(
    3,
    'Văn hóa và đạo đức',
    'assets/icons/home_screen/complied/person.svg.vec',
  ),
  kyThuatLaiXe(
    4,
    'Kỹ thuật lái xe',
    'assets/icons/home_screen/complied/steering_wheel.svg.vec',
  ),
  cauTaoVaSuaChua(
    5,
    'Cấu tạo và sửa chữa',
    'assets/icons/home_screen/complied/danger_fire.svg.vec',
  ),
  bienBaoDuongBo(
    6,
    'Biển báo đường bộ',
    'assets/icons/home_screen/complied/turn_right_sign.svg.vec',
  ),
  saHinhVaTinhHuong(
    7,
    'Sa hình và tình huống',
    'assets/icons/home_screen/complied/traffic_light.svg.vec',
  );

  const Chapter(this.chapterDbIndex, this.chapterName, this.iconAssetPath);

  final int chapterDbIndex;
  final String chapterName;
  final String iconAssetPath;
}
