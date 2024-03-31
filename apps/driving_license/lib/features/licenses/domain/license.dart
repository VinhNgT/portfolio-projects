import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';
import 'package:driving_license/features/exams/domain/exam_info.dart';

enum License {
  all(
    iconAssetPath: 'assets/icons/home_screen/compiled/danger_fire.svg.vec',
  ),
  a1(
    iconAssetPath: 'assets/icons/vehicles/compiled/motorbike-1.svg.vec',
    examInfo: ExamInfo(
      examQuestionsCount: 25,
      minimumPassingScore: 21,
      examDurationInMinutes: 19,
      examStructure: ExamStructure(
        dangerQuestionsCount: 1,
        chaptersInfo: {
          Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
            subChapterQuestionsCount: {
              SubChapter.cacKhaiNiem: 1,
              SubChapter.quyTacGiaoThong: 6,
              SubChapter.tocDoKhoangCach: 1,
            },
          ),
          Chapter.nghiepVuVanTai: ChapterExamInfo(
            chapterQuestionsCount: 0,
          ),
          Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.kyThuatLaiXe: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.cauTaoVaSuaChua: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.bienBaoDuongBo: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
          Chapter.saHinhVaTinhHuong: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
        },
      ),
    ),
  ),
  a2(
    iconAssetPath: 'assets/icons/vehicles/compiled/motorbike-2.svg.vec',
    examInfo: ExamInfo(
      examQuestionsCount: 25,
      minimumPassingScore: 23,
      examDurationInMinutes: 19,
      examStructure: ExamStructure(
        dangerQuestionsCount: 1,
        chaptersInfo: {
          Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
            subChapterQuestionsCount: {
              SubChapter.cacKhaiNiem: 1,
              SubChapter.quyTacGiaoThong: 6,
              SubChapter.tocDoKhoangCach: 1,
            },
          ),
          Chapter.nghiepVuVanTai: ChapterExamInfo(
            chapterQuestionsCount: 0,
          ),
          Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.kyThuatLaiXe: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.cauTaoVaSuaChua: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.bienBaoDuongBo: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
          Chapter.saHinhVaTinhHuong: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
        },
      ),
    ),
  ),
  a3(
    iconAssetPath: 'assets/icons/vehicles/compiled/motorbike-scooter.svg.vec',
    examInfo: ExamInfo(
      examQuestionsCount: 25,
      minimumPassingScore: 23,
      examDurationInMinutes: 19,
      examStructure: ExamStructure(
        dangerQuestionsCount: 1,
        chaptersInfo: {
          Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
            subChapterQuestionsCount: {
              SubChapter.cacKhaiNiem: 1,
              SubChapter.quyTacGiaoThong: 6,
              SubChapter.tocDoKhoangCach: 1,
            },
          ),
          Chapter.nghiepVuVanTai: ChapterExamInfo(
            chapterQuestionsCount: 0,
          ),
          Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.kyThuatLaiXe: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.cauTaoVaSuaChua: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.bienBaoDuongBo: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
          Chapter.saHinhVaTinhHuong: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
        },
      ),
    ),
  ),
  a4(
    iconAssetPath: 'assets/icons/vehicles/compiled/loader-truck.svg.vec',
    examInfo: ExamInfo(
      examQuestionsCount: 25,
      minimumPassingScore: 23,
      examDurationInMinutes: 19,
      examStructure: ExamStructure(
        dangerQuestionsCount: 1,
        chaptersInfo: {
          Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
            subChapterQuestionsCount: {
              SubChapter.cacKhaiNiem: 1,
              SubChapter.quyTacGiaoThong: 6,
              SubChapter.tocDoKhoangCach: 1,
            },
          ),
          Chapter.nghiepVuVanTai: ChapterExamInfo(
            chapterQuestionsCount: 0,
          ),
          Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.kyThuatLaiXe: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.cauTaoVaSuaChua: ChapterExamInfo(
            chapterQuestionsCount: 1,
            isInPool: true,
          ),
          Chapter.bienBaoDuongBo: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
          Chapter.saHinhVaTinhHuong: ChapterExamInfo(
            chapterQuestionsCount: 7,
          ),
        },
      ),
    ),
  ),
  b1(
    iconAssetPath: 'assets/icons/vehicles/compiled/car.svg.vec',
    examInfo: ExamInfo(
      examQuestionsCount: 30,
      minimumPassingScore: 27,
      examDurationInMinutes: 20,
      examStructure: ExamStructure(
        dangerQuestionsCount: 1,
        chaptersInfo: {
          Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
            subChapterQuestionsCount: {
              SubChapter.cacKhaiNiem: 1,
              SubChapter.quyTacGiaoThong: 6,
              SubChapter.tocDoKhoangCach: 1,
            },
          ),
          Chapter.nghiepVuVanTai: ChapterExamInfo(
            chapterQuestionsCount: 0,
          ),
          Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.kyThuatLaiXe: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.cauTaoVaSuaChua: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.bienBaoDuongBo: ChapterExamInfo(
            chapterQuestionsCount: 9,
          ),
          Chapter.saHinhVaTinhHuong: ChapterExamInfo(
            chapterQuestionsCount: 9,
          ),
        },
      ),
    ),
  ),
  b2(
    iconAssetPath: 'assets/icons/vehicles/compiled/taxi.svg.vec',
    examInfo: ExamInfo(
      examQuestionsCount: 35,
      minimumPassingScore: 32,
      examDurationInMinutes: 22,
      examStructure: ExamStructure(
        dangerQuestionsCount: 1,
        chaptersInfo: {
          Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
            subChapterQuestionsCount: {
              SubChapter.cacKhaiNiem: 1,
              SubChapter.quyTacGiaoThong: 7,
              SubChapter.tocDoKhoangCach: 1,
            },
          ),
          Chapter.nghiepVuVanTai: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.kyThuatLaiXe: ChapterExamInfo(
            chapterQuestionsCount: 2,
          ),
          Chapter.cauTaoVaSuaChua: ChapterExamInfo(
            chapterQuestionsCount: 1,
          ),
          Chapter.bienBaoDuongBo: ChapterExamInfo(
            chapterQuestionsCount: 10,
          ),
          Chapter.saHinhVaTinhHuong: ChapterExamInfo(
            chapterQuestionsCount: 10,
          ),
        },
      ),
    ),
  );

  const License({
    required this.iconAssetPath,
    this.examInfo = const ExamInfo(
      examQuestionsCount: 600,
      minimumPassingScore: 0,
      examDurationInMinutes: 60,
      examStructure: ExamStructure(
        dangerQuestionsCount: 0,
        chaptersInfo: {},
      ),
    ),
  });

  final String iconAssetPath;
  final ExamInfo examInfo;
}
