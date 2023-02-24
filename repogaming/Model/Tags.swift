//
//  Tags.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct Tags: Mappable {
  var id: Int?
  var name: String?
  var slug: String?
  var language: String?
  var gamesCount: Int?
  var imageBackground: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    slug <- map["slug"]
    language <- map["language"]
    gamesCount <- map["games_count"]
    imageBackground <- map["image_background"]
  }
}
