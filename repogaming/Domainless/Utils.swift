//
//  Utils.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 27/02/23.
//

import Foundation

struct Utils {
    static func getReleaseDate(_ gameItem: GameItem) -> String {
        return gameItem.released?.changeDateFormat(from: "yyyy-MM-dd", to: "dd MMMM yyyy") ?? "-"
    }
    static func roundToOneDecimal(_ num: Float) -> String {
        let number: Float = num
        let roundedNumber = Float(Int(number * 10)) / 10
        let formattedNumber = String(format: "%.1f", roundedNumber)
        return formattedNumber
    }
}
