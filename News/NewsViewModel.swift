//
//  NewsViewModel.swift
//  News
//
//  Created by salome on 29.12.23.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        isLoading = true
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=707df27fa5a4451ab0408eebc146ce68") else {
            isLoading = false
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Temperatures.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
                self.isLoading = false
            }, receiveValue: { temperatures in
                self.articles = temperatures.articles
            })
            .store(in: &cancellables)
    }
}
