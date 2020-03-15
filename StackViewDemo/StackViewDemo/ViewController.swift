//
//  ViewController.swift
//  StackViewDemo
//
//  Created by DhakaLive on 3/15/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl.dataSource = self
        tbl.delegate = self
        tbl.rowHeight = UITableView.automaticDimension
        tbl.separatorStyle = .none
        
        tbl.register(UINib(nibName: "TestTableViewCell", bundle: Bundle(for: TestTableViewCell.self)), forCellReuseIdentifier: "TestTableViewCell")
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as? TestTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(119)
    }
    
}

