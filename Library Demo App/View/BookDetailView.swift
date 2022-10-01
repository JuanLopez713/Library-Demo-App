//
//  BookDetailView.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var bookList: BookModel
    var book: Book
    @State var isFavorite = false
    @State var ratingPicked = 0

    @State var uiTabarController: UITabBarController?
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
                    bookList.objectWillChange.send()
                    isFavorite = book.favorite
                }, label: {
                    Image(systemName: isFavorite ? "bookmark.circle.fill" : "bookmark.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                        .onAppear { isFavorite = book.favorite }

                })

                RatingSystem(book: book, rating: $ratingPicked)
                    .foregroundColor(.red)
                    .font(.title)
                    .onAppear { ratingPicked = book.rating }
            }
            .frame(width: geo.size.width)

        }.navigationBarTitle("Title", displayMode: .inline)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bookList = BookModel()
        let firstBook = bookList.books[0]
        BookDetailView(book: firstBook)
            .environmentObject(BookModel())
    }
}
