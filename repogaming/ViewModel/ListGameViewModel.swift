//
//  ListGameViewModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import SwiftUI
import RealmSwift

@MainActor class ListGameViewModel: ObservableObject {
    private let gameService = ApiService()
    
    @Published private(set) var games: [GameItem] = []
    @Published private(set) var searchedGames: [GameItem] = []
    @Published private(set) var gamesRealm: [GameItemRealmModel] = []
    
    var currentPage: Int = 1
    var currentPageSearched: Int = 1
    
    var realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to open Realm database: \(error.localizedDescription)")
        }
    }
    
    func loadGames() async throws {
        let response = try await gameService.fetchGames(page: currentPage)
        guard let results = response?.results else { return }
        games += results
        getGames()
    }
    
    func loadSearchGames(text: String) async throws {
        let response = try await gameService.fetchSearchGames(page: currentPageSearched, text: text)
        guard let results = response?.results else { return }
        searchedGames += results
    }
    
    func makeSearchedGamesEmpty() {
        searchedGames = []
    }
    
    func getGames() {
        let realmGames = realm.objects(GameItemRealmModel.self)
        gamesRealm = Array(realmGames)
    }
    
    func addGame(game: GameItem, completion: BoolCompletion) {
        guard isAllowedToAddFavorite(game: game) else {
            completion(false)
            return
        }
        
        let newGame = getRealmModel(game: game)
        do {
            try realm.write {
                realm.add(newGame)
            }
        } catch {
            completion(false)
            fatalError("Failed to add game to Realm database: \(error.localizedDescription)")
        }
        getGames()
        completion(true)
    }
    
    func getRealmModel(game: GameItem) -> GameItemRealmModel {
        let newGame = GameItemRealmModel()
        newGame.id = game.id ?? 0
        newGame.name = game.name ?? ""
        newGame.rating = game.rating ?? 0
        newGame.ratingsCount = game.ratingsCount ?? 0
        newGame.backgroundImage = game.backgroundImage ?? ""
        newGame.released = game.released ?? ""
        return newGame
    }
    
    func isAllowedToAddFavorite(game: GameItem) -> Bool {
        return gamesRealm.filter({ $0.id == (game.id ?? 0) }).isEmpty
    }
}
