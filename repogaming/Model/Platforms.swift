//
//  Platforms.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct Platforms: Mappable {
  var platform: Platform?
  var releasedAt: String?
  var requirements: Any?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    platform <- map["platform"]
    releasedAt <- map["released_at"]
    requirements <- map["requirements"]
  }
}

struct ParentPlatforms: Mappable {
  var platform: Platform?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    platform <- map["platform"]
  }
}

struct Platform: Mappable {
  var id: Int?
  var name: String?
  var slug: String?
  var image: Any?
  var yearEnd: Any?
  var yearStart: Int?
  var gamesCount: Int?
  var imageBackground: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    slug <- map["slug"]
    image <- map["image"]
    yearEnd <- map["year_end"]
    yearStart <- map["year_start"]
    gamesCount <- map["games_count"]
    imageBackground <- map["image_background"]
  }
}
