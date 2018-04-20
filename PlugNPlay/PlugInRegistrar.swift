//
//  PlugInRegistrar.swift
//  PlugNPlay
//
//  Created by Rezeq, Maher on 4/20/18.
//  Copyright © 2018 NativeNCreative. All rights reserved.
//

import UIKit

// Protocol / Extension
class PlugInRegistrar<T> {

    var plugInArray:[T] = []

    func registerPlugIn(_ plugIn: T) -> Bool {
        plugInArray.append(plugIn)
        return true
    }
}

class ViewControllerRegistrar: PlugInRegistrar<ViewControllerDelegate>, ViewControllerDelegate  {

    func setParent(_ parent: UIViewController) {
        for delegate in plugInArray {
                delegate.setParent(parent)
            }
    }

    func viewDidLoad() {
        for delegate in plugInArray {
            delegate.viewDidLoad()
        }
    }

    func viewWillAppear(_ animated: Bool) {
        for delegate in plugInArray {
            delegate.viewWillAppear(animated)
        }
    }

    func viewWillDisappear(_ animated: Bool) {
        for delegate in plugInArray {
            delegate.viewWillDisappear(animated)
        }
    }
}
