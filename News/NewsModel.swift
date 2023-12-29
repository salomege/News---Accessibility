//
//  NewsModel.swift
//  News
//
//  Created by salome on 28.12.23.
//

import Foundation



struct Temperatures: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

