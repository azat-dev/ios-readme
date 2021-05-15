//
//  BookViews.swift
//  ReadMe
//
//  Created by Azat Kaiumov on 08.05.2021.
//

import SwiftUI

extension Book {
    struct Image: View {
        var uiImage: UIImage?
        let title: String
        let size: CGFloat?
        let cornderRadius: CGFloat
        
        var body: some View {
            
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                    .resizable()
                    .frame(width: size, height: size)
                    .scaledToFill()
                    .cornerRadius(cornderRadius)
                
            } else {
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

extension Book.Image {
    init(title: String) {
        self.init(
            uiImage: nil,
            title: title,
            size: nil,
            cornderRadius: .init()
        )
    }
}

struct BookViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(
                uiImage: nil,
                title: Book().title,
                size: 80.0,
                cornderRadius: 12
            )
            Book.Image(
                uiImage: nil,
                title: "",
                size: 80.0,
                cornderRadius: 12
            )
            Book.TitleAndAuthorStack(
                book: Book(),
                titleFont: .title,
                authorFont: .title2
            )
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
