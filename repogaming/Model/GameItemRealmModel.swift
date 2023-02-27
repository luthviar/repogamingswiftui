//
//  GameItemRealmModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 27/02/23.
//

import Foundation
import RealmSwift

class GameItemRealmModel: Object, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var rating: Float = 0
    @objc dynamic var ratingsCount: Int = 0
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var released: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
}

protocol RealmFetchable {
    associatedtype FetchResult
    static func primaryKey() -> String?
    static func fetch(in realm: Realm) -> FetchResult
}

extension GameItemRealmModel: RealmFetchable {
    typealias FetchResult = Results<GameItemRealmModel>
    static func fetch(in realm: Realm) -> Results<GameItemRealmModel> {
        return realm.objects(GameItemRealmModel.self)
    }
}

