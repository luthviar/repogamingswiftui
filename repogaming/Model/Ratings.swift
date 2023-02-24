//
//  Ratings.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct Ratings: Mappable {
  var id: Int?
  var title: String?
  var count: Int?
  var percent: Float?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    title <- map["title"]
    count <- map["count"]
    percent <- map["percent"]
  }
}
