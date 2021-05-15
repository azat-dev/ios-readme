//
//  ContentView.swift
//  ReadMe
//
//  Created by Azat Kaiumov on 08.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()
    var body: some View {
        NavigationView {
            List(library.sortedBooks, id: \.self) { book in
                BookRow(
                    book: book,
                    image: $library.uiImages[book]
                )
            }.navigationTitle("My Library")
        }
    }
}

struct BookRow: View {
    let book: Book
    @Binding var image: UIImage?
    
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book, image: $image)
        )  {
            HStack {
                Book.Image(
                    uiImage: image,
                    title: book.title,
                    size: 80.0,
                    cornderRadius: 12.0
                )
                Book.TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    .lineLimit(1)
            }.padding(.vertical, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewedInAllColorSchemes
    }
}
