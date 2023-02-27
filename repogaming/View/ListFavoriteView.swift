//
//  ListFavoriteView.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 27/02/23.
//

import SwiftUI
import RealmSwift

struct ListFavoriteView: View {
    @StateObject private var viewModel = ListFavoriteViewModel()
    
    @State private var isChooseDeleteState: Bool = false
    @State private var showAlertDeleteSuccess: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.gamesRealm.isEmpty {
                    Spacer()
                    Text("Your Favorite Game is still empty")
                        .font(.title2)
                        .frame(alignment: .center)
                    Spacer()
                } else {
                    List(viewModel.gamesRealm) { game in
                        if game.realm == nil {
                            Text("-")
                        } else {
                            HStack(spacing: isChooseDeleteState ? 20 : 0) {
                                if isChooseDeleteState {
                                    HStack {
                                        Image(systemName: "minus.circle")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .transition(.slide.combined(with: .opacity))
                                            .foregroundColor(.orange)
                                    }
                                    .frame(width: 60, height: 60)
                                    .onTapGesture {
                                        guard let index = viewModel.gamesRealm.firstIndex(of: game) else { return }
                                        viewModel.deleteGame(at: IndexSet(integer: index))
                                        showAlertDeleteSuccess = true
                                    }
                                    .alert(isPresented: $showAlertDeleteSuccess) {
                                        Alert(
                                            title: Text("You have successfully deleted the game from your favorite list"),
                                            message: Text(""),
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
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getGames()
            }
            .navigationTitle("Favorite Games")
            .navigationBarItems(
                leading:
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isChooseDeleteState.toggle()
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.orange)
                        Text("Delete Favorite")
                            .foregroundColor(.orange)
                    },
                trailing:
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Text("About Me")
                            Image(systemName: "info.circle")
                        }
                    }
            )
        }
    }
}

struct ListFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ListFavoriteView()
    }
}
