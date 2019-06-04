//
//  ViewController.swift
//  Template
//
//  Created by Chris Bogie on 2019-05-22.
//  Copyright © 2019 Chris Bogie. All rights reserved.
//

import UIKit

class RootController: UIViewController {
    
    @available(*,unavailable) required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let rootView = RootView(frame: .zero)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
}
