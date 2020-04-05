//
//  AuthenticationHandler.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/4/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import Combine
import Alamofire

class LoginHandler: APIHandler {
    
    @Published var woofResponse: WoofResponse?
    @Published var isLoading = false
            
    func getRandomDog() {
        isLoading = true
        
        let url = "https://random.dog/woof.json"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<WoofResponse, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? WoofResponse else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.woofResponse = response
        }
    }
    
}
