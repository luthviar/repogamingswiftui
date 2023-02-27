//
//  DetailGameView.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import SwiftUI

struct DetailGameView: View {
    
    @StateObject var viewModel: DetailGameViewModel
    
    private var releaseDate: String {
        return viewModel.detailGame?.released?.changeDateFormat(from: "yyyy-MM-dd", to: "dd MMMM yyyy") ?? "-"
    }
    
    private var urlWebsiteGame: URL {
        var urlWebsiteString: String = viewModel.detailGame?.website ?? ""
        if urlWebsiteString.isEmpty {
            urlWebsiteString = "https://www.google.com/search?q=\(viewModel.gameItem.name.components(separatedBy: " ")[0])"
        }
        return URL(string: urlWebsiteString)!
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ItemCarousel(urlString: viewModel.detailGame?.backgroundImage ?? "")
                        ForEach(viewModel.screenshots, id: \.id) { screenshot in
                            ItemCarousel(urlString: screenshot.image ?? "")
                        }
                    }
                    .frame(minHeight: Constants.heightImageCarousel)
                }
                .padding(.leading, 10)
                Text("you can tap the image above to view more detail and zoom it")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 10)
                
                Text(viewModel.gameItem.name)
                    .font(.subheadline)
                    .bold()
                Text("Release: \(releaseDate)")
                    .font(.subheadline)
                    .padding([.bottom, .leading, .trailing])
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.yellow)
                    Text("\(Utils.roundToOneDecimal(viewModel.gameItem.rating))")
                        .font(.system(size: 13))
                    Text("(\(viewModel.gameItem.ratingsCount))")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                }
                
                Divider()
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(viewModel.detailGame?.genres ?? [], id: \.id) { genre in
                        Text(genre.name ?? "")
                            .font(.subheadline)
                            .bold()
                            .padding()
                            .multilineTextAlignment(.center)
                    }
                }
                
                Divider()
                
                Text(viewModel.detailGame?.descriptionRaw ?? "")
                    .padding()
                                                                              
            }
        }
        .navigationTitle(viewModel.gameItem.name)
        .navigationBarItems(
            trailing:
                Link(destination: urlWebsiteGame, label: {
                    HStack {
                        Text("Website")
                        Image(systemName: "globe")
                    }
                })
        )
        .task {
            try? await viewModel.loadScreenshots()
            try? await viewModel.loadDetailGame()
        }
    }
}


