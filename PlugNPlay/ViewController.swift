//
//  ViewController.swift
//  PlugNPlay
//
//  Created by Rezeq, Maher on 4/20/18.
//  Copyright © 2018 NativeNCreative. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func setParent(_ parent: UIViewController)
}

class ViewController: UIViewController, ViewControllerDelegate {

    func setParent(_ parent: UIViewController) {

    }

    var delegate: ViewControllerDelegate?
    var plugInRegistrar: ViewControllerRegistrar = ViewControllerRegistrar()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        // Read plugin needed from config
        let metric = MetricsPlugIn()
        plugInRegistrar.registerPlugIn(metric)
        let network = NetworkRequestPlugIn(url: URL(string: "http://www.stackoverflow.com")!)
        plugInRegistrar.registerPlugIn(network)
        let UI = UIPlugIn()
        plugInRegistrar.registerPlugIn(UI)

        // Define the refrence
        delegate = plugInRegistrar
        plugInRegistrar.setParent(self) 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         delegate?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        delegate?.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
         delegate?.viewWillDisappear(animated)
    }
}


