import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

enum FriendshipLevel {
  undefined,
  acquaintance,
  casual,
  close,
  intimate,
  nasty,
}

enum DateType {
  notifications,
  alarm,
  history,
}

class Person {
  final String id;
  final String name;
  final String surnames;
  final String imageAsset;
  final String? imageUrl;
  final File? imageFile; // Temporary file for new images
  final FriendshipLevel level;
  final DateTime lastInteraction;
  final DateType dateType;

  Person({
    required this.id,
    required this.name,
    this.surnames = '',
    required this.imageAsset,
    this.imageUrl,
    this.imageFile,
    required this.level,
    required this.lastInteraction,
    required this.dateType,
  });

  String get levelEmoji {
    switch (level) {
      case FriendshipLevel.undefined:
        return "assets/icons/level_undefined.png";
      case FriendshipLevel.acquaintance:
        return "assets/icons/level_acquaintance.png";
      case FriendshipLevel.casual:
        return "assets/icons/level_casual.png";
      case FriendshipLevel.close:
        return "assets/icons/level_close.png";
      case FriendshipLevel.intimate:
        return "assets/icons/level_intimate.png";
      case FriendshipLevel.nasty:
        return "assets/icons/level_nasty.png";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surnames': surnames,
      'imageAsset': imageAsset,
      'imageUrl': imageUrl,
      'level': level.name,
      'lastInteraction': Timestamp.fromDate(lastInteraction),
      'dateType': dateType.name,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map, String documentId) {
    return Person(
      id: documentId,
      name: map['name'] ?? '',
      surnames: map['surnames'] ?? '',
      imageAsset: map['imageAsset'] ?? 'assets/images/default_profile.jpg',
      imageUrl: map['imageUrl'],
      level: FriendshipLevel.values.firstWhere(
        (e) => e.name == map['level'],
        orElse: () => FriendshipLevel.undefined,
      ),
      lastInteraction: (map['lastInteraction'] as Timestamp).toDate(),
      dateType: DateType.values.firstWhere(
        (e) => e.name == map['dateType'],
        orElse: () => DateType.history,
      ),
    );
  }
}
