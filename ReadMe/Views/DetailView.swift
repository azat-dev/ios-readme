//
//  DetailView.swift
//  ReadMe
//
//  Created by Azat Kaiumov on 15.05.2021.
//

import SwiftUI

import class PhotosUI.PHPickerViewController


struct DetailView: View {
    let book: Book
    
    @Binding var image: UIImage?
    @State var showingImagePicker = false
    
    var body: some View {
        VStack(alignment: .center) {
            Book.TitleAndAuthorStack(
                book: book,
                titleFont: .title,
                authorFont: .title2
            )
            Book.Image(title: book.title, size: nil)
            Button("Update Image...", action: { showingImagePicker = true}).padding()
            Spacer()
        }.padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}
