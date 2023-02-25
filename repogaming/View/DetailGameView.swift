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
            urlWebsiteString = "https://www.google.com/search?q=\(viewModel.gameName.components(separatedBy: " ")[0])"
        }
        return URL(string: urlWebsiteString)!
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        CarouselItem(urlString: viewModel.detailGame?.backgroundImage ?? "")
                        ForEach(viewModel.screenshots, id: \.id) { screenshot in
                            CarouselItem(urlString: screenshot.image ?? "")
                        }
                    }
                    .frame(minHeight: Constants.heightImageCarousel)
                }
                .padding(.leading, 10)
                Text("you can tap the image above to view more detail and zoom it")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 10)
                
                Text(viewModel.gameName)
                    .font(.subheadline)
                    .bold()
                Text("Release: \(releaseDate)")
                    .font(.subheadline)
                    .padding([.bottom, .leading, .trailing])
                
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
        .navigationTitle(viewModel.gameName)
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

struct CarouselItem: View {
    
    let urlString: String
    
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(
                        width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 20 / 100),
                        height: Constants.heightImageCarousel
                    )
                    .cornerRadius(8)
                    .scaledToFit()
            case .success(let image):
                NavigationLink(destination: ImageZoomView(image: image)) {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 20 / 100),
                            height: Constants.heightImageCarousel
                        )
                        .cornerRadius(8)
                }
            case .failure:
                Image(systemName: "exclamationmark.icloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 20 / 100),
                        height: Constants.heightImageCarousel
                    )
                    .cornerRadius(8)
            @unknown default:
                fatalError()
            }
        }
    }
    
}
