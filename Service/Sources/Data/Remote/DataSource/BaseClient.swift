//
//  BaseRemote.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Alamofire
import Moya
import CombineMoya
import Combine
import Foundation

public class BaseClient<API: VBAAPI> {
    static func request(_ api: API) -> AnyPublisher<Moya.Response, Error>{
        
        let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
        
        if(!NetworkReachabilityManager(host: "https://api.pexels.com")!.isReachable) {
            return Future<Moya.Response, Error> { result in
                result(.failure(VBAError.error(message: "서버에 접속할 수 없습니다.")))
            }
            .eraseToAnyPublisher()
        }
        provider.requestPublisher(api)
            .sink { err in
                print(err)
            } receiveValue: { res in
                print(res)
            }

        print("\(api.baseURL)"+api.path)
        return provider.requestPublisher(api, callbackQueue: .main)
            .mapError{ VBAError.error(errorBody: ["status" : $0.response?.statusCode ?? 0]) }
            .timeout(15, scheduler: DispatchQueue.main, customError: { VBAError.error(message: "요청시간이 만료되었습니다")})
            .eraseToAnyPublisher()
    }
}

