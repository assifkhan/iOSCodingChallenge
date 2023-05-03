//
//  NetworkContants.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import Foundation


struct NetworkContants{
    static var url:URL {
        return URL(string: "http://api.duckduckgo.com/?q=simpsons+characters&format=json")!
    }
}
