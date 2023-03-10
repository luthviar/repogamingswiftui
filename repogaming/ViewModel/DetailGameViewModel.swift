//
//  DetailGameViewModel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import SwiftUI

@MainActor class DetailGameViewModel: ObservableObject {
        
    let gameItem: GameItemRealmModel
    
    init(gameItem: GameItemRealmModel) {
        self.gameItem = gameItem
    }
        
    private let gameService = ApiService()
    
    @Published private(set) var detailGame: DetailGameModel?
    @Published private(set) var screenshots: [Screenshot] = []
    
    func loadDetailGame() async throws {
        let response = try await gameService.fetchDetailGame(id: gameItem.id)
        guard let response = response else { return }
        detailGame = response
    }
    
    func loadScreenshots() async throws {
        let response = try await gameService.fetchGameScreenshots(gameId: gameItem.id)
        guard let response = response else { return }
        guard let resScreenshots = response.results else { return }
        screenshots = resScreenshots
    }
}
