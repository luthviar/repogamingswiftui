//
//  DetailGameModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct DetailGameModel: Mappable {
  var id: Int?
  var slug: String?
  var name: String?
  var nameOriginal: String?
  var description: String?
  var metacritic: Int?
  var metacriticPlatforms: [MetacriticPlatforms]?
  var released: String?
  var tba: Bool?
  var updated: String?
  var backgroundImage: String?
  var backgroundImageAdditional: String?
  var website: String?
  var rating: Float?
  var ratingTop: Int?
  var ratings: [Ratings]?
  var reactions: Reactions?
  var added: Int?
  var addedByStatus: AddedByStatus?
  var playtime: Int?
  var screenshotsCount: Int?
  var moviesCount: Int?
  var creatorsCount: Int?
  var achievementsCount: Int?
  var parentAchievementsCount: Int?
  var redditUrl: String?
  var redditName: String?
  var redditDescription: String?
  var redditLogo: String?
  var redditCount: Int?
  var twitchCount: Int?
  var youtubeCount: Int?
  var reviewsTextCount: Int?
  var ratingsCount: Int?
  var suggestionsCount: Int?
  var alternativeNames: [String]?
  var metacriticUrl: String?
  var parentsCount: Int?
  var additionsCount: Int?
  var gameSeriesCount: Int?
  var userGame: Any?
  var reviewsCount: Int?
  var saturatedColor: String?
  var dominantColor: String?
  var parentPlatforms: [ParentPlatforms]?
  var platforms: [Platforms]?
  var stores: [Stores]?
  var developers: [Developers]?
  var genres: [Genres]?
  var tags: [Tags]?
  var publishers: [Publishers]?
  var esrbRating: EsrbRating?
  var clip: Any?
  var descriptionRaw: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    slug <- map["slug"]
    name <- map["name"]
    nameOriginal <- map["name_original"]
    description <- map["description"]
    metacritic <- map["metacritic"]
    metacriticPlatforms <- map["metacritic_platforms"]
    released <- map["released"]
    tba <- map["tba"]
    updated <- map["updated"]
    backgroundImage <- map["background_image"]
    backgroundImageAdditional <- map["background_image_additional"]
    website <- map["website"]
    rating <- map["rating"]
    ratingTop <- map["rating_top"]
    ratings <- map["ratings"]
    reactions <- map["reactions"]
    added <- map["added"]
    addedByStatus <- map["added_by_status"]
    playtime <- map["playtime"]
    screenshotsCount <- map["screenshots_count"]
    moviesCount <- map["movies_count"]
    creatorsCount <- map["creators_count"]
    achievementsCount <- map["achievements_count"]
    parentAchievementsCount <- map["parent_achievements_count"]
    redditUrl <- map["reddit_url"]
    redditName <- map["reddit_name"]
    redditDescription <- map["reddit_description"]
    redditLogo <- map["reddit_logo"]
    redditCount <- map["reddit_count"]
    twitchCount <- map["twitch_count"]
    youtubeCount <- map["youtube_count"]
    reviewsTextCount <- map["reviews_text_count"]
    ratingsCount <- map["ratings_count"]
    suggestionsCount <- map["suggestions_count"]
    alternativeNames <- map["alternative_names"]
    metacriticUrl <- map["metacritic_url"]
    parentsCount <- map["parents_count"]
    additionsCount <- map["additions_count"]
    gameSeriesCount <- map["game_series_count"]
    userGame <- map["user_game"]
    reviewsCount <- map["reviews_count"]
    saturatedColor <- map["saturated_color"]
    dominantColor <- map["dominant_color"]
    parentPlatforms <- map["parent_platforms"]
    platforms <- map["platforms"]
    stores <- map["stores"]
    developers <- map["developers"]
    genres <- map["genres"]
    tags <- map["tags"]
    publishers <- map["publishers"]
    esrbRating <- map["esrb_rating"]
    clip <- map["clip"]
    descriptionRaw <- map["description_raw"]
  }
}

struct Publishers: Mappable {
  var id: Int?
  var name: String?
  var slug: String?
  var gamesCount: Int?
  var imageBackground: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    slug <- map["slug"]
    gamesCount <- map["games_count"]
    imageBackground <- map["image_background"]
  }
}

struct Developers: Mappable {
  var id: Int?
  var name: String?
  var slug: String?
  var gamesCount: Int?
  var imageBackground: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    slug <- map["slug"]
    gamesCount <- map["games_count"]
    imageBackground <- map["image_background"]
  }
}

struct Reactions: Mappable {
  var _1: Int?
  var _2: Int?
  var _3: Int?
  var _4: Int?
  var _5: Int?
  var _6: Int?
  var _7: Int?
  var _8: Int?
  var _9: Int?
  var _10: Int?
  var _11: Int?
  var _12: Int?
  var _14: Int?
  var _15: Int?
  var _16: Int?
  var _18: Int?
  var _20: Int?
  var _21: Int?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    _1 <- map["1"]
    _2 <- map["2"]
    _3 <- map["3"]
    _4 <- map["4"]
    _5 <- map["5"]
    _6 <- map["6"]
    _7 <- map["7"]
    _8 <- map["8"]
    _9 <- map["9"]
    _10 <- map["10"]
    _11 <- map["11"]
    _12 <- map["12"]
    _14 <- map["14"]
    _15 <- map["15"]
    _16 <- map["16"]
    _18 <- map["18"]
    _20 <- map["20"]
    _21 <- map["21"]
  }
}

struct MetacriticPlatforms: Mappable {
  var metascore: Int?
  var url: String?
  var platform: Platform?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    metascore <- map["metascore"]
    url <- map["url"]
    platform <- map["platform"]
  }
}
