//
//  Genres.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct Genres: Mappable {
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
