import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_chapter_selection_repository.g.dart';

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

// Question repository will depend on this repository to get the chapter that
// the user has selected.
// We need to keep this alive so it can be set in the home screen and not get
// auto disposed.
@Riverpod(keepAlive: true)
class UserChapterSelectionRepository extends _$UserChapterSelectionRepository {
  @override
  Chapter? build() {
    // This will be called when user exit QuestionRoute, reset the state
    // back to null
    ref.onCancel(() {
      state = null;
    });

    return null;
  }

  set value(Chapter? chapter) {
    state = chapter;
  }
}
