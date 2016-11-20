//
//  CornerRadius.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/20/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

@IBDesignable
class CornerRadius: UIView {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    
    configure()
    
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    configure()
    
  }
  
  func configure(){
    
    layer.masksToBounds = true
    layer.cornerRadius = 2.0
    
  }

}
