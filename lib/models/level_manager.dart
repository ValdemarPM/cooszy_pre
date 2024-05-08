import 'package:cooszy_pre/models/level.dart';

class LevelManager {
  final Map<int, Level> _levelsByNum = {};
  final Map<String, Level> _levelsByDescription = {};
  final Map<String, Level> _levelsByIconName = {};

  factory LevelManager() => _instance;

  static final LevelManager _instance = LevelManager._internal();

  LevelManager._internal() {
    _addLevel(Level(1, "add_reaction_outlined", "Intimate friend"));
    _addLevel(Level(2, "sentiment_very_satisfied_outlined", "Close friend"));
    _addLevel(Level(3, "sentiment_satisfied_outlined", "Casual friend"));
  }

  void _addLevel(Level level) {
    _levelsByNum[level.levelNum] = level;
    _levelsByDescription[level.levelDescription] = level;
    _levelsByIconName[level.levelIcon] = level;
  }

  Level? getLevelByNum(int num) => _levelsByNum[num];

  Level? getLevelByDescription(String description) =>
      _levelsByDescription[description];

  Level? getLevelByIconName(String iconName) => _levelsByIconName[iconName];
}
