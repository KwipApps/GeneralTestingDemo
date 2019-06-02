//
//  UITextFieldStub.swift
//  LoginFormTests
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import UIKit

class UITextFieldStub: UITextField {
    
    init(text: String) {
        super.init(frame: CGRect.zero)
        super.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
