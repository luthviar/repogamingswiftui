//
//  ItemGameView.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 27/02/23.
//

import SwiftUI

struct ItemGameView: View {
    
    let game: GameItem
    
    var body: some View {
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
                
                Text("Release: \(Utils.getReleaseDate(game))")
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.yellow)
                    Text("\(Utils.roundToOneDecimal(game.rating ?? 0))")
                        .font(.system(size: 13))
                    Text("(\(game.ratingsCount ?? 0))")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                }
                
            }
        }
    }
}
