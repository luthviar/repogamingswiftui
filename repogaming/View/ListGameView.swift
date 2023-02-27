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
    @State private var showAlertFavorite: Bool = false
    @State private var isChooseFavoriteState: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(searchResults) { game in
                    HStack(spacing: isChooseFavoriteState ? 20 : 0) {
                        if isChooseFavoriteState {
                            HStack {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .transition(.slide.combined(with: .opacity))
                            }
                            .frame(width: 60, height: 60)
                            .onTapGesture {
                                showAlertFavorite = true
                            }
                            .alert(isPresented: $showAlertFavorite) {
                                Alert(
                                    title: Text("You have successfully added the game to your favorite list"),
                                    message: Text("Tap long press to one of your favorite game"),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                        }
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
                }
                .navigationTitle("Games")
                .navigationBarItems(
                    leading:
                        Button(action: {
                            withAnimation(.easeInOut) {
                                isChooseFavoriteState.toggle()
                            }
                        }) {
                            Image(systemName: "heart.circle")
                                .foregroundColor(.red)
                            Text("Select Favorite")
                                .foregroundColor(.red)
                        },
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
