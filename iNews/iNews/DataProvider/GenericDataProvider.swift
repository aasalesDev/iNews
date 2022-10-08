//
//  GenericDataProvider.swift
//  iNews
//
//  Created by Anderson Sales on 17/08/22.
//

import Foundation

protocol GenericDataProvider {
    func success(model: Any)
    func errorData(_ provide: GenericDataProvider?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
