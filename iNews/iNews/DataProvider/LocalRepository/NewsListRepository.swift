//
//  NewsListRepository.swift
//  iNews
//
//  Created by Anderson Sales on 17/08/22.
//

import Foundation

enum NewsListError: Error {
    case fileNotFound
}

class NewsListRepository {
    //design pattern = Singleton (Unique instance) - uses the keyword "shared"
    static var shared: NewsListRepository = {
        let instance = NewsListRepository()
        return instance
    }()
    
    //The private init prevents new instances from being created
    private init(){}
    
    func getNewsList(completion: ([NewsModel]?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: "NewsList", ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                let newsModelList = try decoder.decode([NewsModel].self, from: data)
                completion(newsModelList, nil)
            } catch {
                print("Something went wrong...")
                completion(nil, error)
            }
        } else {
            completion(nil, NewsListError.fileNotFound)
        }
    }
}
