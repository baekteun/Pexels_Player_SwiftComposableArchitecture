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

class BaseRemote<API: VBAAPI> {
    private let provider = MoyaProvider<API>(plugins: [PexelsPlugin()])
    
    func request(_ api: API) -> AnyPublisher<Response, Error>{
        if(!NetworkReachabilityManager(host: "https://api.pexels.com")!.isReachable) {
            return Future<Moya.Response, Error> { result in
                result(.failure(VBAError.error(message: "서버에 접속할 수 없습니다.")))
            }
            .eraseToAnyPublisher()
        }
        
        return provider.requestPublisher(api, callbackQueue: .main)
            .mapError{ VBAError.error(errorBody: ["status" : $0.response?.statusCode ?? 0]) }
            .timeout(120, scheduler: DispatchQueue.main, customError: { VBAError.error(message: "요청시간이 만료되었습니다")})
            .eraseToAnyPublisher()
    }
}

