//
//  Stores.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct Stores: Mappable {
  var id: Int?
  var url: String?
  var store: Store?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    url <- map["url"]
    store <- map["store"]
  }
}

struct Store: Mappable {
  var id: Int?
  var name: String?
  var slug: String?
  var domain: String?
  var gamesCount: Int?
  var imageBackground: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    slug <- map["slug"]
    domain <- map["domain"]
    gamesCount <- map["games_count"]
    imageBackground <- map["image_background"]
  }
}
