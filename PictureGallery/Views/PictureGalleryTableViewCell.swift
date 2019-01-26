//
//  PictureGalleryTableViewCell.swift
//  PictureGallery
//
//  Created by Nelson Gonzalez on 1/21/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PictureGalleryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var delegate: PhotoTableViewCellDelegate?
    
    @IBOutlet weak var likeButton: UIButton!
    var picture: Picture? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let picture = picture, let pictureData = picture.image else {return}
        
        let image = UIImage(data: pictureData)
        pictureImageView.image = image
        descriptionLabel.text = picture.title
        let buttonTitle = picture.isLiked ? "Unlike" : "Like"
        likeButton.setTitle(buttonTitle, for: .normal)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func likeUnlikeButtonPressed(_ sender: UIButton) {
        delegate?.tappedLikeButton(on: self)
    }
    

}
