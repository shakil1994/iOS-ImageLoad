//
//  DetailsViewController.swift
//  SImageLoad
//
//  Created by DhakaLive on 1/16/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import UIKit
import SDWebImage
import JGProgressHUD

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var realNameLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var firstApperanceLabel: UILabel!
    
    @IBOutlet weak var createdbyLabel: UILabel!
    
    @IBOutlet weak var publisherLabel: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!
    
    var photo: Photos?
    
    let hud = JGProgressHUD(style: JGProgressHUDStyle.dark)
    
    private func showHUD(){
        hud.textLabel.text = "Loading Todos..."
        hud.show(in: self.view)
        
    }
    
    private func hideHUD(){
        hud.dismiss()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        showHUD()
        if let photo = photo {
            self.detailsLabel.text = photo.name
            self.nameLabel.text = String("Name: \(photo.name)")
            self.realNameLabel.text = photo.realname
            self.createdbyLabel.text = photo.createdby
            self.bioTextView.text = photo.bio
            self.teamLabel.text = photo.team
            self.firstApperanceLabel.text = photo.firstappearance
            self.publisherLabel.text = photo.publisher
            //self.movieImageView.sd_setImage(with: URL(string: photo.imageurl), completed: nil)
            let imageUrl:NSURL? = NSURL(string: photo.imageurl)
            //cell.colorImageView.image = String(photo.url)
            if let url = imageUrl {
                self.movieImageView.sd_setImage(with: url as URL)
            }
            hideHUD()
            
        }
    }
    
}
