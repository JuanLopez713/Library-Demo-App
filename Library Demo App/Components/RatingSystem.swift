//
//  RatingSystem.swift
//  Library Demo App
//
//  Created by Juan Lopez on 10/1/22.
//

import SwiftUI

struct RatingSystem: View {
    var maxRating = 5
    var minRating = 0
    var book: Book
    @Binding var rating: Int
    var body: some View {
        buildRating(for: rating)
    }

    func buildRating(for rating: Int) -> some View {
        return HStack {
            Button {
                self.rating = 1
                book.rating = self.rating
            } label: {
                Image(systemName: self.rating >= 1 ? "star.fill" : "star").tag(1)
            }
            Button {
                self.rating = 2
                book.rating = self.rating
            } label: {
                Image(systemName: self.rating >= 2 ? "star.fill" : "star").tag(2)
            }
            Button {
                self.rating = 3
                book.rating = self.rating
            } label: {
                Image(systemName: self.rating >= 3 ? "star.fill" : "star").tag(3)
            }
            Button {
                self.rating = 4
                book.rating = self.rating
            } label: {
                Image(systemName: self.rating >= 4 ? "star.fill" : "star").tag(4)
            }
            Button {
                self.rating = 5
                book.rating = self.rating
            } label: {
                Image(systemName: self.rating >= 5 ? "star.fill" : "star").tag(5)
            }

//            ForEach(0 ..< rating, id: \.self) { r in
//                Button {
//                    self.rating = r + 1
//                } label: {
//                    Image(systemName: "star.fill").tag(r)
//                }
//            }
//            ForEach(0 ..< (maxRating - rating), id: \.self) { r in
//                Button {
//                    self.rating = r + rating + 1
//                } label: {
//                    Image(systemName: "star").tag(r + rating)
//                }
//            }
            //        if rating > maxRating {
            //            return
            //        } else {
            //  return Image(systemName: "star")
            //        }
        }
    }
}

struct RatingSystem_Previews: PreviewProvider {
    static var previews: some View {
        let bookList = BookModel()
        
        RatingSystem(book: bookList.books[0], rating: Binding.constant(3))
    }
}
