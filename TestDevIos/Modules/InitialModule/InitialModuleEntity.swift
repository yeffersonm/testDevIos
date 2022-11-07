//
//  InitialModuleEntity.swift
//  TestDevIos
//
//  Created by MacBooK Pro on 4/11/22.
//

struct post: Codable {
    let data: [data]
}

struct data: Codable {
    let id: Int
    let user_id: Int
    let title: String
    let body: String
}
