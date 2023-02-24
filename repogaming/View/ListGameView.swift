//
//  ListGameView.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import SwiftUI

struct ListGameView: View {
    @StateObject private var viewModel = ListGameViewModel()
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.games) { game in
                    NavigationLink(
                        destination: AboutView()
                    ) {
                        HStack {
                            AsyncImage(url: URL(string: game.backgroundImage ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(
                                            width: 80,
                                            height: 80
                                        )
                                        .cornerRadius(8)
                                        .scaledToFit()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(
                                            width: 80,
                                            height: 80
                                        )
                                        .background(Color.black)
                                        .cornerRadius(20)
                                        .padding(.trailing, 4)
                                case .failure:
                                    Image(systemName: "exclamationmark.icloud.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(
                                            width: 80,
                                            height: 80
                                        )
                                        .background(Color.black)
                                        .cornerRadius(20)
                                        .padding(.trailing, 4)
                                @unknown default:
                                    fatalError()
                                }
                            }
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(game.name ?? "")
                                    .font(.system(size: 25, weight: .bold))
                                
                                Text(game.released ?? "")
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
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
    }
    
    private func loadPage(next: Bool = false) {
        if next { viewModel.currentPage += 1 }
        isLoading = true
        Task {
            try? await viewModel.loadGames()
            isLoading = false
        }
    }
    
    private func isNeedToLoadMore(showedGameItem: GameItem) -> Bool {
        let isNeedIt: Bool = ((showedGameItem.slug ?? "-") == (viewModel.games.last?.slug ?? "+"))
        return isNeedIt
    }
    
}

struct ListGameView_Previews: PreviewProvider {
    static var previews: some View {
        ListGameView()
    }
}
