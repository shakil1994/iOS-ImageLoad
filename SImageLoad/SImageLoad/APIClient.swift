//
//  APIClient.swift
//  SImageLoad
//
//  Created by DhakaLive on 1/15/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import Foundation

class APIClient {
    //private let photoUrl = URL(string: "https://jsonplaceholder.typicode.com/photos")
    private let movieUr = URL(string: "https://www.simplifiedcoding.net/demos/marvel/")
    
    func getAllPhotos(_ completion: @escaping (Data) -> Void) {
        let request = URLRequest(url: movieUr!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil || data == nil {
                print("Server Error")
                return
            }
            
            guard let data = data else {
                print("Response Error")
                return
            }
            //print(String(data: data, encoding: .utf8)!)
            completion(data)
        }
        task.resume()
    }
}


