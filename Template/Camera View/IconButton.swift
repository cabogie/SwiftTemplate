//
//  IconButton.swift
//  Distortvid
//
//  Created by Chris Bogie on 2019-05-28.
//  Copyright © 2019 Chris Bogie. All rights reserved.
//

import Foundation
import UIKit

class IconButton: UIControl {
    @available (*, unavailable) required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    let iconView = UIImageView()
    var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    override var tintColor: UIColor! {
        didSet {
            iconView.tintColor = self.tintColor
        }
    }
    
    init(frame: CGRect, icon: UIImage?) {
        super.init(frame: frame)
        
        iconView.image = icon
        iconView.contentMode = .center
        self.addSubview(iconView)
    }
    
    override func layoutSubviews() {
        iconView.frame = self.bounds
    }
    
}
