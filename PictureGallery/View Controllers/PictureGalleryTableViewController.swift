//
//  PictureGalleryTableViewController.swift
//  PictureGallery
//
//  Created by Nelson Gonzalez on 1/21/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PictureGalleryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return PictureController.shared.pictures.count
        
        switch section {
        case 0:
            return PictureController.shared.isLiked.count
        case 1:
            return PictureController.shared.isUnliked.count
        default:
           return 0
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath) as! PictureGalleryTableViewCell

     //   let pictureGallery = PictureController.shared.pictures[indexPath.row]
        var picture: Picture!
        if indexPath.section == 0 {
            picture = PictureController.shared.isLiked[indexPath.row]
        } else if indexPath.section == 1 {
            picture = PictureController.shared.isUnliked[indexPath.row]
        }
        
        cell.picture = picture
        cell.delegate = self
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 && PictureController.shared.isLiked.count > 0 {
            return "Liked Pictures"
        } else if section == 1 && PictureController.shared.isUnliked.count > 0 {
            return "Unliked Pictures"
        } else {
            return nil
        }
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            PictureController.shared.delete(picture: pictureFor(indexPath: indexPath))
            // Delete the row from the data source
            tableView.reloadData()
        }
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PictureGalleryTableViewController: PhotoTableViewCellDelegate {
    func tappedLikeButton(on cell: PictureGalleryTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let picture = pictureFor(indexPath: indexPath)
    
        PictureController.shared.updateIsLiked(for: picture)
    
        tableView.reloadData()
    }
    
    private func pictureFor(indexPath: IndexPath) -> Picture {
        if indexPath.section == 0 {
            return PictureController.shared.isLiked[indexPath.row]
        } else {
            return PictureController.shared.isUnliked[indexPath.row]
        }
    }
    
}
