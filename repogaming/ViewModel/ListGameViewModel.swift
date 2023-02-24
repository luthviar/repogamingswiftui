//
//  ListGameViewModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import SwiftUI

@MainActor class ListGameViewModel: ObservableObject {
    private let gameService = ApiService()
    
    @Published private(set) var games: [GameItem] = []
    @Published private(set) var searchedGames: [GameItem] = []
    
    var currentPage: Int = 1
    var currentPageSearched: Int = 1
        
    func loadGames() async throws {
        let response = try await gameService.fetchGames(page: currentPage)
        guard let results = response?.results else { return }
        games += results
    }
    
    func loadSearchGames(text: String) async throws {
        let response = try await gameService.fetchSearchGames(page: currentPageSearched, text: text)
        guard let results = response?.results else { return }
        searchedGames += results
    }
    
    func makeSearchedGamesEmpty() {
        searchedGames = []
    }
}

