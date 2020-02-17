//
//  ViewController.swift
//  SImageLoad
//
//  Created by DhakaLive on 1/15/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import UIKit
import SDWebImage
import JGProgressHUD

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let apiClient = APIClient()
    var photos = [Photos]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath) as! CustomImageTableViewCell
        
        let photo = photos[indexPath.row]
        
        let imageUrl:NSURL? = NSURL(string: photo.imageurl)
        //cell.colorImageView.image = String(photo.url)
        if let url = imageUrl {
            cell.colorImageView.sd_setImage(with: url as URL)
        }
        cell.idLabel.text = photo.name
        cell.teamLabel.text = photo.team
        cell.createdLabel.text = photo.createdby
        return cell
    }
    
    private func getPhotos(){
        showHUD()
        apiClient.getAllPhotos { [weak self] result in
            do{
                let data = try JSONDecoder().decode([Photos].self, from: result)
                self?.photos += data
                DispatchQueue.main.sync {
                    self?.hideHUD()
                    self?.imageViewTable.reloadData()
                }
            } catch (let error){
                print(error.localizedDescription)
            }
//            let data = try? JSONDecoder().decode([Photos].self, from: result)
//            if let data = data {
//                self?.photos += data
//                DispatchQueue.main.sync {
//                 self?.imageViewTable.reloadData()
//                }
//
//            } else {
//                print("Server vResponse Errror")
//            }
            
        }
    }
    
    @IBOutlet weak var imageViewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getPhotos()
    }
    
    let hud = JGProgressHUD(style: JGProgressHUDStyle.dark)
    
    private func showHUD(){
        hud.textLabel.text = "Loading Todos..."
        hud.show(in: self.imageViewTable)
    }
    
    private func hideHUD(){
        hud.dismiss()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController" ) as! DetailsViewController

        let photo = photos[indexPath.row]
        vc.photo = photo

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

