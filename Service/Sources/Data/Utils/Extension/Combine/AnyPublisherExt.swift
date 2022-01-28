//
//  AnyPublisherExt.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Combine
import Moya
import Foundation

extension AnyPublisher where Output == Moya.Response, Failure == Error {
    func map<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder(), failsOnEmptyData: Bool = true) -> AnyPublisher<D, Error> {
        return unwrapThrowable { response in
            try response.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
        }
    }
}

extension AnyPublisher where Failure == Error {
    func unwrapThrowable<T>(throwable: @escaping (Output) throws -> T) -> AnyPublisher<T, Error> {
        self.tryMap { element in
            try throwable(element)
        }
        .eraseToAnyPublisher()
    }
}
