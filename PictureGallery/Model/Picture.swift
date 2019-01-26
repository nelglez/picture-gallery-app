//
//  Picture.swift
//  PictureGallery
//
//  Created by Nelson Gonzalez on 1/21/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

struct Picture: Equatable, Codable {
    var image: Data?
    var title: String?
    var isLiked: Bool
    
    init(image: Data?, title: String?, isLiked: Bool = false) {
        self.image = image
        self.title = title
        self.isLiked = isLiked
    }
}
