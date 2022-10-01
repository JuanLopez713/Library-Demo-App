//
//  BookDetailView.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import SwiftUI

struct BookDetailView: View {
    var book: Book
    @State var isFavorite = false
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(book.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 4 / 5, alignment: .center)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                HStack {
                    Text(book.bookTitle).bold()

                    Text(book.author)
                }
                Button(action: {
                    BookHelper.favoriteBook(book: book)
                    setFavorite()
                }, label: {
                    if isFavorite {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                })

            }.onAppear{setFavorite()}
            .frame(width: geo.size.width)
        }
    }
    func setFavorite(){
        isFavorite = book.favorite
    }
}



struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bookList = BookModel()
        let firstBook = bookList.books[0]
        BookDetailView(book: firstBook)
    }
}
