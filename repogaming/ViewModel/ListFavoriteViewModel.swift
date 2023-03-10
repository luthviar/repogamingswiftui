//
//  ListFavoriteViewModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 27/02/23.
//

import SwiftUI
import RealmSwift

@MainActor class ListFavoriteViewModel: ObservableObject {
    
    @Published private(set) var gamesRealm: [GameItemRealmModel] = []
    
    var realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to open Realm database: \(error.localizedDescription)")
        }
    }
    
    func getGames() {
        let realmGames = realm.objects(GameItemRealmModel.self)
        gamesRealm = Array(realmGames)
    }
    
    func deleteGame(at offsets: IndexSet) {
        do {
            let realm = try Realm()
            try realm.write {
                guard let index = offsets.first else { return }
                let game = gamesRealm[index]
                realm.delete(game)
                gamesRealm.remove(at: index)
            }
        } catch {
            print("Error deleting game: \(error)")
        }
    }
}


