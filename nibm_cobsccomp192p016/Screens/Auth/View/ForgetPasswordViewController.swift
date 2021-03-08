//
//  ForgetPasswordViewController.swift
//  nibm_cobsccomp192p016
//
//  Created by Ravindu Tharaka Ranathunga on 2021-03-07.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ForgetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var UserName: UITextField!
    
    @IBAction func Submit(_ sender: Any) {
        if(UserName.text == nil){
            
        }
        else{
            Auth.auth().sendPasswordReset(withEmail: UserName.text!) { error in
                        DispatchQueue.main.async {
                            if self.UserName.text?.isEmpty==true || error != nil {
                                let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                self.present(resetFailedAlert, animated: true, completion: nil)
                            }
                            if error == nil && self.UserName.text?.isEmpty==false{
                                let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                                resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                self.present(resetEmailAlertSent, animated: true, completion: nil)
                            }
                        }
                    }
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
