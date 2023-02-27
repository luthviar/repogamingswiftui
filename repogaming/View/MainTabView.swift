//
//  MainTabView.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 27/02/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ListGameView()
                .tabItem {
                    Label("List Game", systemImage: "list.dash")
                }

            ListFavoriteView()
                .tabItem {
                    Label("List Favorite", systemImage: "heart.circle")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
