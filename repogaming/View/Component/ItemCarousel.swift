//
//  ItemCarousel.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 27/02/23.
//

import SwiftUI

struct ItemCarousel: View {
    
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

struct ItemCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ItemCarousel(urlString: "")
    }
}
