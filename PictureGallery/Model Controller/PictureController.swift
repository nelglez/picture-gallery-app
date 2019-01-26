//
//  PictureController.swift
//  PictureGallery
//
//  Created by Nelson Gonzalez on 1/21/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
class PictureController {
    //MARK: - Class memberwise initializer
    init() {
        loadFromPersistentStore()
    }
    
    
    //MARK: - Variables
    
    static let shared = PictureController()
    
    private(set) var pictures: [Picture] = []
    
    //MARK: - CRUD
    
    func create(picture: Data, title: String){
        let picture = Picture(image: picture, title: title)
        pictures.append(picture)
        saveToPersistentStore()
    }
    
    func delete(picture: Picture){
        guard let index = pictures.index(of: picture) else {return}
        pictures.remove(at: index)
        saveToPersistentStore()
    }
    
    func toggleIsLiked(on index: Int) {
        pictures[index].isLiked = !pictures[index].isLiked
        saveToPersistentStore()
    }
    
    //MARK: - Persistance Functions
    
    private var persistentFileUrl: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        let finalLocation = documentsDirectory.appendingPathComponent("photoGallery.plist")
       
        return finalLocation
    }
    
    func saveToPersistentStore(){
        //where to save to?
        guard let url = persistentFileUrl else {return}
        //needs to convert to be data its a star right now.
        let encoder = PropertyListEncoder()
        //what are we encoding? ALl of our Stars.
        //How? we have to try.
        do {
            let data = try encoder.encode(pictures)
            //need to write it.
            try data.write(to: url)
        } catch {
            print(error)
        }
        
    }
    
    func loadFromPersistentStore(){
        //get data from file first
        guard let url = persistentFileUrl, FileManager.default.fileExists(atPath: url.path) else {return}
        
        do {
            
            let data = try Data(contentsOf: url)
            //asign it to stars array. Decode first
             let decoder = PropertyListDecoder()
            //decode an array os Stars
            pictures = try decoder.decode([Picture].self, from: data)
        } catch {
            print(error)
        }
        
    }
}
