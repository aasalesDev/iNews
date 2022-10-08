//
//  NewsListLocalDataProvider.swift
//  iNews
//
//  Created by Anderson Sales on 17/08/22.
//

import Foundation

protocol NewsListLocalDataProviderProtocol: GenericDataProvider {}

class NewsListLocalDataProvider: DataProviderManager<NewsListLocalDataProviderProtocol, NewsModel> {
    
    func getNewsList() {
        
        NewsListRepository.shared.getNewsList{ newsModelList, error in
            if let error = error {
                self.delegate?.errorData(self.delegate, error: error)
                return
            }
            
            if let model = newsModelList {
                self.delegate?.success(model: model)
            }
        }
    }
}
