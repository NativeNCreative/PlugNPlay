//
//  UIPlugIn.swift
//  PlugNPlay
//
//  Created by Rezeq, Maher on 4/20/18.
//  Copyright © 2018 NativeNCreative. All rights reserved.
//

import UIKit

class UIPlugIn: ViewControllerDelegate {
    public var parent: UIViewController?

    func setParent(_ parent: UIViewController) {
        self.parent = parent
    }

    func viewDidLoad() {
        print("Metrics, viewDidLoad")
        parent?.view.backgroundColor = UIColor.green
    }

    func viewWillAppear(_ animated: Bool) {
        print("Metrics, viewWillAppear")
    }

    func viewWillDisappear(_ animated: Bool) {
        print("Metrics, viewWillDisappear")
    }
}
