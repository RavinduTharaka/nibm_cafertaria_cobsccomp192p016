//
//  BaseView.swift
//  nibm_cobsccomp192p016
//
//  Created by Ravindu Tharaka Ranathunga on 2021-03-06.
//

import Foundation
import  UIKit

@IBDesignable class BaseView: UIView{
    override init(frame: CGRect){
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure(){
        
    }
}
