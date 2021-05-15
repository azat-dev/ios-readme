//
//  Book.swift
//  ReadMe
//
//  Created by Azat Kaiumov on 08.05.2021.
//

struct Book {
    let author: String
    let title: String

    init(author: String = "Author", title: String = "Title") {
        self.author = author
        self.title = title
    }
}
