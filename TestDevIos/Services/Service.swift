//
//  Service.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//

import Foundation
import Alamofire

class Service {
    
    static let shared = Service()
    
    func requestForPosts(completion: @escaping(Result<post,Error>) -> Void) {
        AF.request(caseApi.listPost.path).responseDecodable(of: post.self) { response in
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
