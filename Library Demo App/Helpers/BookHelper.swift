//
//  ParseBooks.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import Foundation
class BookHelper{
    static func getLocalData()->[Book]{
        // Parse local library JSON file

        // Get a url path to JSON File
        let pathString = Bundle.main.path(forResource: "library", ofType: "json")

        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Book]()
        }

        // Create a url object
        let url = URL(fileURLWithPath: pathString!)

        do {
            // Create a data object
            let data = try Data(contentsOf: url)

            let decoder = JSONDecoder()
            do {
                // Decode the data with a JSON decoder

                let bookData = try decoder.decode([Book].self, from: data)
                // Add the unique IDs to each recipe
                for book in bookData {
                    book.id = UUID()
                    
                    // Add the unique IDs to each ingredient
                    for page in book.content {
                        page.id = UUID()
                    }
                }
                // Return the recipes
                return bookData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return [Book]()
        
    }
    
    static func favoriteBook(book: Book){
        if book.favorite{
            book.favorite = false
        }else{
            book.favorite = true
        }
       
    }
}
