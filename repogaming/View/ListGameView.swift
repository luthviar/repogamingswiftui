//
//  ListGameView.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import SwiftUI

struct ListGameView: View {
    @StateObject private var viewModel = ListGameViewModel()
    @State private var isLoading: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(searchResults) { game in
                    NavigationLink(
                        destination:
                            DetailGameView(
                                viewModel:
                                    DetailGameViewModel(
                                        gameItem: game
                                    )
                            )
                    ) {
                        ItemGameView(game: game)
                            .onAppear {
                                if isNeedToLoadMore(showedGameItem: game) {
                                    loadPage(next: true)
                                }
                            }
                    }
                }
                .navigationTitle("Games")
                .navigationBarItems(
                    trailing:
                        NavigationLink(destination: AboutView()) {
                            HStack {
                                Text("About Me")
                                Image(systemName: "info.circle")
                            }
                        }
                )
                .overlay {
                    if isLoading && viewModel.games.isEmpty {
                        ProgressView()
                            .scaleEffect(5)
                    }
                }
                if isLoading && !viewModel.games.isEmpty {
                    ProgressView()
                }
            }
        }
        .task {
            loadPage()
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search")
        .onSubmit(of: .search) {
            viewModel.makeSearchedGamesEmpty()
            loadPage()
        }
    }
    
    var searchResults: [GameItem] {
        if searchText.isEmpty {
            return viewModel.games
        } else {
            return viewModel.searchedGames
        }
    }
    
    private func loadPage(next: Bool = false) {
        if next {
            if searchText.isEmpty {
                viewModel.currentPage += 1
            } else {
                viewModel.currentPageSearched += 1
            }
        }
        isLoading = true
        Task {
            if searchText.isEmpty {
                try? await viewModel.loadGames()
            } else {
                try? await viewModel.loadSearchGames(text: searchText)
            }
            isLoading = false
        }
    }
    
    private func isNeedToLoadMore(showedGameItem: GameItem) -> Bool {
        let isNeedIt: Bool = ((showedGameItem.slug ?? "-") == (viewModel.games.last?.slug ?? "+"))
        return isNeedIt
    }
    
}

struct SearchBar: View {
    @Binding var searchText: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText, onCommit: {
                onSearchButtonClicked()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                onSearchButtonClicked()
            }, label: {
                Text("Search")
            })
        }
        .padding()
    }
}

struct ListGameView_Previews: PreviewProvider {
    static var previews: some View {
        ListGameView()
    }
}
