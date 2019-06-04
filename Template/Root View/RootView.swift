//
//  RootView.swift
//  Template
//
//  Created by Chris Bogie on 2019-05-28.
//  Copyright © 2019 Chris Bogie. All rights reserved.
//

import Foundation
import UIKit

class RootView: UIView {
    
    @available (*, unavailable) required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
    }
    
    override func layoutSubviews() {
        
    }
    
}
