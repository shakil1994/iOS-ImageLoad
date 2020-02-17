//
//  ScrollViewController.swift
//  SImageLoad
//
//  Created by DhakaLive on 1/16/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {


    @IBOutlet weak var bio: UILabel!
    
    var photo: Photos?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let photo = photo {
            self.bio.text = photo.bio
        }
    }
    
    
    
}
