//
//  Book.swift
//  ReadMe
//
//  Created by Azat Kaiumov on 08.05.2021.
//

struct Book: Hashable {
    let title: String
    let author: String

    init(title: String = "Title", author: String = "Author") {
        self.author = author
        self.title = title
    }
}
