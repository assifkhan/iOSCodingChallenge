//
//  ListViewModel.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import Foundation

class ListViewModel {
    
    var responesModel:CharactersResponseModel?
    var reloadUI:(()->Void)?
    var serviceFilter:((_ search:String)->Void)?
    var serviceFailure:((Error)->Void)?
    private var itemFilter:String = ""
    init(){
        self.serviceFilter = { search in
            self.itemFilter = search
            self.reloadUI?()
        }
    }
    
    func loadService() {
        URLSessionManager.shared.fetchData(url: NetworkContants.url) { (result:Result<CharactersResponseModel, Error>) in
            switch result {
            case .success(let success):
                self.responesModel = success
                self.reloadUI?()
            case .failure(let failure):
                self.serviceFailure?(failure)
            }
        }
    }
    
    func numberOfRows()->Int{
        
        if itemFilter == "" {
            
            return responesModel?.relatedTopics.count ?? 0
        }
        return responesModel?.relatedTopics.filter({$0.text.lowercased().contains(itemFilter.lowercased())}).count ?? 0
        
    }
    
    func item(indexPath:IndexPath) -> RelatedTopic?{
        
        if itemFilter == "" {
            return responesModel?.relatedTopics[indexPath.row]
        }
        return responesModel?.relatedTopics.filter({$0.text.lowercased().contains(itemFilter.lowercased())})[indexPath.row]
    }
}
