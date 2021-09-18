import 'dart:ui';

class Constant {
  //Fonts
  static const String FONT_SF_PRO  = 'SF Pro Display';
  static const FontWeight FONT_WEIGHT_LIGHT  = FontWeight.w300;
  static const FontWeight FONT_WEIGHT_REGULAR  = FontWeight.w400;
  static const FontWeight FONT_WEIGHT_MEDIUM  = FontWeight.w500;
  static const FontWeight FONT_WEIGHT_SEMI_BOLD  = FontWeight.w600;
  static const FontWeight FONT_WEIGHT_BOLD  = FontWeight.w700;
  static const String FONT_SF_PRO_LIGHT = 'SF Pro Display Light';
  static const String FONT_SF_PRO_REGULAR  = 'SF Pro Display Regular';
  static const String FONT_SF_PRO_MEDIUM = 'SF Pro Display Medium';
  static const String FONT_SF_PRO_SEMIBOLD = 'SF Pro Display Semibold';
  static const String FONT_SF_PRO_BOLD  = 'SF Pro Display Bold';

  //Colors
  static const PrimaryColor =  Color(0xFFED1C26);
  static const White = Color(0xFFFFFFFF);
  static const Green = Color(0xFF28C36B);
  static const TextBoxBackground = Color(0xFFEBF2F7);
  static const Azure = Color(0xFF0093FF);
  static const LightBlue = Color(0xFF1A7BFF);
  static const EggShell = Color(0xFFDBE2E6);
  static const BackgroundGrey = Color(0xFFFAFAFA);
  static const ColorRed = Color(0xFFED1C26);
  static const Red = Color(0xFFDE0000);
  static const Light_Silver = Color(0xFFFAFAFA);
  static const Black = Color(0xFF000000);
  static const Sliver = Color(0xFFF0F0F0);
  static const Dark_Grey = Color(0xFF707070);

  //Screen Names
  static const HOME_SCREEN = 'Home Screen';
  static const GAME_DETAILS_SCREEN = 'Game Details Screen';

  //Important
  static const TITLE = 'PS5 Station';

  //Data
  static const OTHER_PLATFORMS = 'Other Platforms';
  static const GENRES = 'Genres';
  static const DEVELOPERS = 'Developers';
  static const PUBLISHERS = 'Publishers';

  //Parameters
  static const REQUEST_DATES = 'dates';
  static const REQUEST_ORDERING = 'ordering';

  //Parameters Ordering
  static const GAME_PAGE = '1';
  static const GAME_PAGE_SIZE = '20';
  static const GAME_PLATFORM = '187';
  static const ORDERING_NAME = 'name';
  static const ORDERING_RELEASED = '-released';
  static const ORDERING_ADDED = 'added';
  static const ORDERING_CREATED = 'created';
  static const ORDERING_UPDATED = 'updated';
  static const ORDERING_RATING = 'rating';
  static const ORDERING_METACRITIC = 'metacritic';
}