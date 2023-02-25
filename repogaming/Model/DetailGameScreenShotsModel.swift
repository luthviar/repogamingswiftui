//
//  DetailGameScreenShotsModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 25/02/23.
//

import Foundation
import ObjectMapper

struct DetailGameScreenshotsModel: Mappable {
    var count: Int?
    var next: String?
    var previous: Any?
    var results: [Screenshot]?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        results <- map["results"]
    }
}

struct Screenshot: Mappable, Identifiable {
    var id: Int?
    var image: String?
    var width: Any?
    var height: [GameItem]?
    var isDeleted: [GameItem]?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        image <- map["image"]
        width <- map["width"]
        height <- map["height"]
        isDeleted <- map["is_deleted"]
    }
}
