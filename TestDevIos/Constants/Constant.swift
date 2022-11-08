//
//  Constant.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 23/09/22.
//

import UIKit


struct constants {
    struct resourceApi {
        static let mainUrl = "https://gorest.co.in"
    }
}
enum caseApi {
    case listPost
    
    var path:String {
        switch self {
        case .listPost:
            return constants.resourceApi.mainUrl + "/public/v1/posts"
        }
    }
}
