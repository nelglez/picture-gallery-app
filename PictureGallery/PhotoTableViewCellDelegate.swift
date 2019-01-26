//
//  PhotoTableViewCellDelegate.swift
//  PictureGallery
//
//  Created by Nelson Gonzalez on 1/21/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
protocol PhotoTableViewCellDelegate: class {
    func tappedLikeButton(on cell: PictureGalleryTableViewCell)
}
