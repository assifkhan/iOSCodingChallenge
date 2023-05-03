//
//  ItemDetailsCell.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import UIKit

class ItemDetailsCell: UITableViewCell {

    @IBOutlet weak var itemImageView:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    

    func config(viewModel: RelatedTopic){
        
        
        lblName.text = viewModel.text
        lblDescription.text = viewModel.result
        
        guard viewModel.icon.url != "" , let url = URL(string: "\(viewModel.firstURL)\(viewModel.icon.url)") else {
            DispatchQueue.main.async {
                self.itemImageView.image = UIImage(systemName: "photo.fill")
            }
            return }
        
        _ = UIImage.downloadImage(url: url, completion: { image in
            DispatchQueue.main.async {
                if let image = image {
                    self.itemImageView.image = image
                } else {
                    self.itemImageView.image = UIImage(systemName: "photo.fill")
                }
            }
        })
        
    }
    
}
