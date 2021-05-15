//
//  BookViews.swift
//  ReadMe
//
//  Created by Azat Kaiumov on 08.05.2021.
//

import SwiftUI

extension Book {
    struct Image: View {
        let title: String
        let size: CGFloat?
        
        var body: some View {
            let symbol = SwiftUI.Image(title: title)
                ?? .init(systemName: "book")
            
            symbol
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
        }
    }
    
    struct TitleAndAuthorStack: View {
        let book: Book
        let titleFont: Font
        let authorFont: Font
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(titleFont)
                Text(book.author)
                    .font(authorFont)
                    .foregroundColor(.secondary)
            }.lineLimit(1)
        }
    }
}

extension Image {
    init?(title: String) {
        guard let character = title.first,
              case let systemName = "\(character.lowercased()).square",
              UIImage(systemName: systemName) != nil else {
            return nil
        }
        
        self.init(systemName: systemName)
    }
}

struct BookViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title, size: 80.0)
            Book.Image(title: "", size: 80.0)
            Book.TitleAndAuthorStack(book: Book(), titleFont: .title, authorFont: .title2)
        }.previewedInAllColorSchemes
    }
}

extension View {
    var previewedInAllColorSchemes: some View {
        ForEach(
            ColorScheme.allCases,
            id: \.self,
            content: preferredColorScheme
        )
    }
}
