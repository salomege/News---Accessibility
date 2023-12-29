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
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                
                ProgressView()
            } else {
                
                List(0..<viewModel.articles.count, id: \.self) { index in
                    Text(viewModel.articles[index].title)
                        .font(.system(size: selectedFontSize))
                }
                .toolbar {
                    
                    ToolbarItem( placement: .navigationBarLeading) {
                        Menu {
                            Button("Small") {selectedFontSize = 12}
                            Button("Medium") {selectedFontSize = 16}
                            Button("Large") {selectedFontSize = 18}
                            Button("Extra Large") {selectedFontSize = 22}
                        } label: {
                            Label("Font Size", systemImage: "textformat.size")
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
