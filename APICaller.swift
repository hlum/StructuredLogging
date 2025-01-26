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

//By using Logger u can just tap on the log and hit space or right click the log message and jump to the caller

final class APICaller {
    func fetchQuotes() async -> [Quote]? {
        guard let url = URL(string: "https://dummyjson.com/quotes") else {
            Logger.standard.info("ERROR: Invalid URL")
            return nil
        }
        do {
            let (data,response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                Logger.standard.info("ERROR: Invalid Response Status Code \(URL.documentsDirectory.path())")
                return nil
            }
            
            let decodedData = try JSONDecoder().decode(Response.self, from: data)
            return decodedData.quotes
        } catch {
            Logger.standard.info("ERROR: Unknown error \(error.localizedDescription)")
            return nil
        }
    }
}
