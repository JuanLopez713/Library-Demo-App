//
//  BookListView.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import SwiftUI

struct BookListView: View {
//    @ObservedObject var bookList = BookModel();
    @EnvironmentObject var bookList: BookModel
    var body: some View {
        NavigationView {
            VStack {
                Text("All Books")

                ScrollView {
                    LazyVStack(alignment: .center) {
                        ForEach(bookList.books) { book in
                            NavigationLink(destination: BookDetailView(book: book), label: {
                                // MARK: Row Item

                                VStack(spacing: 20.0) {
                                    Image(book.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, alignment: .center)
                                        .cornerRadius(10)

                                    Text(book.bookTitle)
                                        .foregroundColor(.black)
                                        .font(.title3)
                                        .bold()
                                    Text(book.author)
                                        .foregroundColor(.black)

                                        .bold()
                                    //                                        RecipeHighlights(highlights: r.highlights).foregroundColor(.black)
                                }
                                .padding()
                                .cornerRadius(20)
                                .shadow(radius: 10)

                            })
                        }
                    }
                }
            }
            .padding(.all, 20.0)
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookModel())
    }
}
