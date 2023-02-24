//
//  EsrbRating.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct EsrbRating: Mappable {
  var id: Int?
  var name: String?
  var slug: String?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    slug <- map["slug"]
  }
}
