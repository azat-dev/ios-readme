//
//  ContentView.swift
//  ReadMe
//
//  Created by Azat Kaiumov on 08.05.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BookRow(book: .init())
    }
}

struct BookRow: View {
    let book: Book
    var body: some View {
        HStack {
            Book.Image(title: book.title)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title2)
                Text(book.author)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

