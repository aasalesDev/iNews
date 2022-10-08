//
//  NewsModel.swift
//  iNews
//
//  Created by Anderson Sales on 17/08/22.
//

import Foundation

struct NewsModel: Codable {
    var source: SourceModel
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
}
