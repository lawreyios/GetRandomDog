//
//  APIHandler.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/4/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import Alamofire
import Combine

class APIHandler {
        
    var statusCode = Int.zero
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return nil
        }
    }
}
