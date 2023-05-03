//
//  ViewController.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        cell.textLabel?.text = "test"
        
        return cell
    }
}
