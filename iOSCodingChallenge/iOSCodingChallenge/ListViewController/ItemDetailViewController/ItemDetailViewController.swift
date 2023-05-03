//
//  ItemDetailViewController.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.register(UINib(nibName: "ItemDetailsCell", bundle: .main), forCellReuseIdentifier: "ItemDetailsCell")
        }
    }
    
    var item: RelatedTopic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

extension ItemDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailsCell", for: indexPath) as? ItemDetailsCell else {
            return UITableViewCell()
        }
        
        cell.config(viewModel: item)
        
        return cell
    }
}

