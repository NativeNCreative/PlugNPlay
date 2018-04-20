//
//  NetworkRequest.swift
//  PlugNPlay
//
//  Created by Rezeq, Maher on 4/20/18.
//  Copyright © 2018 NativeNCreative. All rights reserved.
//

import UIKit

class NetworkRequest {

    func start(_ url: URL) -> Bool {

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data {
            print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
            }
        }
        task.resume()
        
        return true
    }
}


class NetworkRequestPlugIn: NetworkRequest, ViewControllerDelegate {

    var parent: UIViewController?
    var url:URL?

    let networkRequest:NetworkRequest = NetworkRequest()


    init(url: URL) {
        self.url = url
    }

    func setParent(_ parent: UIViewController) {
            self.parent = parent
    }

    func viewDidLoad() {

    }

    func viewWillAppear(_ animated: Bool) {
        networkRequest.start(self.url!)
    }

    func viewWillDisappear(_ animated: Bool) {

    }
}
