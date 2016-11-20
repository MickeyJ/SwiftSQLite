//
//  BaseTextField.swift
//  Learning-SQLite
//
//  Created by Michael Malotte on 11/20/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

@IBDesignable
class BaseTextField: UITextField {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    configure()
    
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    
    configure()
    
  }
  
  func configure(){
    
    leftView = UIView(frame:CGRect(0, 0, 10, 10));
    leftViewMode = UITextFieldViewMode.always
    
    layer.masksToBounds = true
    layer.cornerRadius = 2.0
    font = UIFont(name: "AvenirNext-Medium", size: 18)
    
  }

}


extension CGRect {
  init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
    self.init(x:x, y:y, width:w, height:h)
  }
}
