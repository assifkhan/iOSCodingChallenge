//
//  NetworkContants.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import Foundation


struct NetworkContants {
    
    static var url:URL {
        #if Simpsons
            return URL(string: "http://api.duckduckgo.com/?q=simpsons+characters&format=json")!
        #else
            return URL(string: "http://api.duckduckgo.com/?q=the+wire+characters&format=json")!
        #endif

    }
}
