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


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PictureController.shared.pictures.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath) as! PictureGalleryTableViewCell

        let pictureGallery = PictureController.shared.pictures[indexPath.row]
        
        cell.picture = pictureGallery
        cell.delegate = self
     
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            PictureController.shared.delete(picture: PictureController.shared.pictures[indexPath.row])
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
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
        PictureController.shared.toggleIsLiked(on: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
}
