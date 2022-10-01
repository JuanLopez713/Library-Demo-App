//
//  BookModel.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import Foundation
class BookModel: ObservableObject {
//    @Published var showIngredients = true
//    @Published var showDirections = true
    @Published var books = [Book]()
    
    init(){
        books = BookHelper.getLocalData()
    }
    
}
