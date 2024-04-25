import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:flutter/material.dart';

@immutable
sealed class ChapterDropdownSelectionData {
  const ChapterDropdownSelectionData(this.title);
  final String title;
}

class AllChapterSelection extends ChapterDropdownSelectionData {
  const AllChapterSelection(super.title);
}

class DangerChapterSelection extends ChapterDropdownSelectionData {
  const DangerChapterSelection(super.title);
}

class ChapterSelection extends ChapterDropdownSelectionData {
  final Chapter chapter;
  ChapterSelection(this.chapter) : super(chapter.chapterName);

  @override
  String toString() {
    return 'ChapterSelection: \'${chapter.chapterName}\'';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChapterSelection && other.chapter == chapter;
  }

  @override
  int get hashCode => chapter.hashCode;
}
