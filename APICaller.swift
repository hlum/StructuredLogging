//
//  Logger.swift
//  StructuredLogging
//
//  Created by Hlwan Aung Phyo on 1/26/25.
//

import Foundation

// MARK: - Welcome
struct Response: Decodable {
    let quotes: [Quote]
    let total, skip, limit: Int
}

// MARK: - Quote
struct Quote: Decodable {
    let id: Int
    let quote, author: String
}


final class APICaller {
    func fetchQuotes() async -> [Quote]? {
        guard let url = URL(string: "https://dummyjson.com/quotes") else {
            print("Invalid URL String")
            return nil
        }
        do {
            let (data,response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("invalid response Code")
                return nil
            }
            
            let decodedData = try JSONDecoder().decode(Response.self, from: data)
            return decodedData.quotes
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
