//
//  AddedByStatus.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import Foundation
import ObjectMapper

struct AddedByStatus: Mappable {
  var yet: Int?
  var owned: Int?
  var beaten: Int?
  var toplay: Int?
  var dropped: Int?
  var playing: Int?

  init?(map: Map) {
    mapping(map: map)
  }

  mutating func mapping(map: Map) {
    yet <- map["yet"]
    owned <- map["owned"]
    beaten <- map["beaten"]
    toplay <- map["toplay"]
    dropped <- map["dropped"]
    playing <- map["playing"]
  }
}
