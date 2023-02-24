//
//  ListGameModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct ListGameModel: Mappable {
  var count: Int?
  var next: String?
  var previous: Any?
  var results: [GameItem]?
  var seoTitle: String?
  var seoDescription: String?
  var seoKeywords: String?
  var seoH1: String?
  var noindex: Bool?
  var nofollow: Bool?
  var description: String?
  var filters: Filters?
  var nofollowCollections: [String]?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    count <- map["count"]
    next <- map["next"]
    previous <- map["previous"]
    results <- map["results"]
    seoTitle <- map["seo_title"]
    seoDescription <- map["seo_description"]
    seoKeywords <- map["seo_keywords"]
    seoH1 <- map["seo_h1"]
    noindex <- map["noindex"]
    nofollow <- map["nofollow"]
    description <- map["description"]
    filters <- map["filters"]
    nofollowCollections <- map["nofollow_collections"]
  }
}

struct Filters: Mappable {
  var years: [Years]?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    years <- map["years"]
  }
}

struct Years: Mappable {
  var year: Int?
  var count: Int?
  var nofollow: Bool?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    year <- map["year"]
    count <- map["count"]
    nofollow <- map["nofollow"]
  }
}

struct GameItem: Mappable, Identifiable {
  var id: Int?
  var slug: String?
  var name: String?
  var released: String?
  var tba: Bool?
  var backgroundImage: String?
  var rating: Float?
  var ratingTop: Int?
  var ratings: [Ratings]?
  var ratingsCount: Int?
  var reviewsTextCount: Int?
  var added: Int?
  var addedByStatus: AddedByStatus?
  var metacritic: Int?
  var playtime: Int?
  var suggestionsCount: Int?
  var updated: String?
  var userGame: Any?
  var reviewsCount: Int?
  var saturatedColor: String?
  var dominantColor: String?
  var platforms: [Platforms]?
  var parentPlatforms: [ParentPlatforms]?
  var genres: [Genres]?
  var stores: [Stores]?
  var clip: Any?
  var tags: [Tags]?
  var esrbRating: EsrbRating?
  var shortScreenshots: [ShortScreenshots]?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    slug <- map["slug"]
    name <- map["name"]
    released <- map["released"]
    tba <- map["tba"]
    backgroundImage <- map["background_image"]
    rating <- map["rating"]
    ratingTop <- map["rating_top"]
    ratings <- map["ratings"]
    ratingsCount <- map["ratings_count"]
    reviewsTextCount <- map["reviews_text_count"]
    added <- map["added"]
    addedByStatus <- map["added_by_status"]
    metacritic <- map["metacritic"]
    playtime <- map["playtime"]
    suggestionsCount <- map["suggestions_count"]
    updated <- map["updated"]
    userGame <- map["user_game"]
    reviewsCount <- map["reviews_count"]
    saturatedColor <- map["saturated_color"]
    dominantColor <- map["dominant_color"]
    platforms <- map["platforms"]
    parentPlatforms <- map["parent_platforms"]
    genres <- map["genres"]
    stores <- map["stores"]
    clip <- map["clip"]
    tags <- map["tags"]
    esrbRating <- map["esrb_rating"]
    shortScreenshots <- map["short_screenshots"]
  }
}

struct ShortScreenshots: Mappable {
  var id: Int?
  var image: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    image <- map["image"]
  }
}
