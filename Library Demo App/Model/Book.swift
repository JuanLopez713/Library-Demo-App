//
//  Book.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import Foundation

class Book: Identifiable, Decodable {
    var id: UUID?
    var bookTitle: String
    var author: String
    var year: Int
    var favorite: Bool
    var image: String
    var rating: Int
    var content: [Page]
}
