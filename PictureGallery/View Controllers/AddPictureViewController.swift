//
//  ViewController.swift
//  PictureGallery
//
//  Created by Nelson Gonzalez on 1/21/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class AddPictureViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    var picture: Picture?

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }


    @IBAction func addPictureButtonPressed(_ sender: UIButton) {
        
        
        guard let title = descriptionTextField.text, !title.isEmpty, let image = pictureImageView.image, let imageData = image.pngData()  else {return}
        
       
        PictureController.shared.create(picture: imageData, title: title)
        
        navigationController?.popViewController(animated: true)
      
    }
}

extension AddPictureViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            pictureImageView.contentMode = .scaleAspectFit
            pictureImageView.image = pickedImage
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

