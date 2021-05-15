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
        
        var body: some View {
            let symbol = SwiftUI.Image(title: title)
                ?? .init(systemName: "book")
            
            symbol
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 90)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
        }
    }
}

struct BookViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title)
            Book.Image(title: "")
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
