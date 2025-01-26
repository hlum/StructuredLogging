//
//  ContentView.swift
//  StructuredLogging
//
//  Created by Hlwan Aung Phyo on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    let apiCaller = APICaller()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .task {
            if let quotes = await apiCaller.fetchQuotes() {
                for quote in quotes {
                    print("\(quote.quote)\n\n")
                }
            } else {
                print("No quotes")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
