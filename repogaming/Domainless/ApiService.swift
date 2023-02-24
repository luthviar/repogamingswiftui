//
//  ApiService.swift
//  repogaming
//
//  Created by Luthfi Abdurrahim on 24/02/23.
//

import SwiftUI
import ObjectMapper

class ApiService {
    private let baseUrl: String = "https://api.rawg.io/api/"
    var urlListGames: String {
        return "\(baseUrl)games?key=\(apiKey)"
    }
    let paramPage: String = "&page="
    let pageSize20: String = "&page_size=20"
    let paramSearch: String = "&search="
        
    private let apiKey = "160dc932a07e4f1dbe5cf3e6d7abc0ee"
    
    func fetchGames(page: Int) async throws -> ListGameModel? {
        let urlString: String = "\(urlListGames)\(pageSize20)\(paramPage)\(page)"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = Mapper<ListGameModel>().map(JSONString: String(data: data, encoding: .utf8) ?? "")
        return response
    }
    
    func fetchSearchGames(page: Int, text: String) async throws -> ListGameModel? {
        let urlString: String = "\(urlListGames)\(pageSize20)\(paramPage)\(page)\(paramSearch)\(text)"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = Mapper<ListGameModel>().map(JSONString: String(data: data, encoding: .utf8) ?? "")
        return response
    }
}


