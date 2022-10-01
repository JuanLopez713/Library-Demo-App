//
//  LibraryTabView.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import SwiftUI

struct LibraryTabView: View {
    var body: some View {
        TabView {
            BookListView().tabItem {
                VStack {
                    Image(systemName: "books.vertical.fill")
                    Text("Books")
                }
            }
        }.environmentObject(BookModel())
    }
}

struct LibraryTabView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryTabView()
    }
}
