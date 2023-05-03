//
//  ViewController.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField:UITextField!{
        didSet{
            self.searchTextField.addTarget(self, action: #selector(textFieldChange(_:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var tableView:UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleAPI()
    }
    
    @objc func textFieldChange(_ textField:UITextField){
        viewModel.serviceFilter?(textField.text ?? "")
    }
    
    private func handleAPI(){
        viewModel.reloadUI = {
            DispatchQueue.main.async{ [weak self] in
                guard let self else {return}
                title = viewModel.responesModel?.heading ?? ""
                tableView.reloadData()
            }
        }
        
        viewModel.loadService()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let item = viewModel.item(indexPath: indexPath)
        cell.textLabel?.text = item?.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
        let item = viewModel.item(indexPath: indexPath)
        detailViewController.item = item
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
