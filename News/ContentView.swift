//
//  ContentView.swift
//  News
//
//  Created by salome on 28.12.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - properties
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var selectedFontSize: CGFloat = 16
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
                    .accessibility(hidden: true)
            } else {
                List(0..<viewModel.articles.count, id: \.self) { index in
                    Text(viewModel.articles[index].title)
                        .font(.system(size: selectedFontSize))
                        .accessibility(label: Text("Article Title"))
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button("Small") { selectedFontSize = 12 }
                            Button("Medium") { selectedFontSize = 16 }
                            Button("Large") { selectedFontSize = 18 }
                        } label: {
                            Label("Font Size", systemImage: "textformat.size")
                                .accessibility(label: Text("Font Size Menu"))
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
