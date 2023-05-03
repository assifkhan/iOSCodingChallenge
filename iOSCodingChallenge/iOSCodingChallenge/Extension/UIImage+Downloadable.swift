//
//  UIImage+Downloadable.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import Foundation
import UIKit

extension UIImage {
    public static func downloadImage(url: URL,
                                completion:@escaping(_ image: UIImage?) -> ()) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion (UIImage (data: data))
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
        return task
    }
}
