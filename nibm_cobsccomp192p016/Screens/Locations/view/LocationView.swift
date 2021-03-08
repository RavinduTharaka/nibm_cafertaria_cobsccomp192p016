//
//  LocationView.swift
//  nibm_cobsccomp192p016
//
//  Created by Ravindu Tharaka Ranathunga on 2021-03-06.
//

//import Foundation
import UIKit

@IBDesignable class LoactionView: BaseView{
    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow: (() -> Void)?
    
    @IBAction func handleAllow(_ sender: UIButton){
        didTapAllow?()
    }
    
    @IBAction func handleDeny(_ sender: UIButton){
        
    }
}
