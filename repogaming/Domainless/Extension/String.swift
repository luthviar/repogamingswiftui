//
//  String.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import UIKit

extension String {
    func changeDateFormat(from: String, to: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "en")
        dateFormatter.dateFormat = from
        
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        dateFormatter.dateFormat = to
        return dateFormatter.string(from: date)
    }
}
