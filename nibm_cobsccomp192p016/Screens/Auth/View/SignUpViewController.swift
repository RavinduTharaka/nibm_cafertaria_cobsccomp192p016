//
//  SignUpViewController.swift
//  nibm_cobsccomp192p016
//
//  Created by Ravindu Tharaka Ranathunga on 2021-03-07.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var MobileNo: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if(Password.text == ConfirmPassword.text){
            Auth.auth().createUser(withEmail: Email.text!,password: Password.text!) { (authResult, error) in
                if let error = error as NSError? {
                    switch AuthErrorCode(rawValue: error.code) {
                    case .operationNotAllowed:
                        let alert = UIAlertController(title: "Error", message: "Email is not allowed..!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                                                                         case .emailAlreadyInUse:
                            let alert = UIAlertController(title: "Error", message: "The email address is already in use by another account.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            break
                            
                    case .invalidEmail:
                        let alert = UIAlertController(title: "Error", message: "The email address is badly formatted. ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                    case .weakPassword:
                        let alert = UIAlertController(title: "Error", message: "The password must be 6 characters long or more . ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                    default:
                        let alert = UIAlertController(title: "Error", message: "Something is wrong", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                }
                print("User signs up successfully")
                let newUserInfo = Auth.auth().currentUser
                let email = newUserInfo?.email
                self.ref = Database.database().reference()
                self.ref.child("user").child(self.MobileNo.text ?? "0").setValue(["email": self.Email.text!])
                if let error = error {
                    let alert = UIAlertController(title: "Failed", message: "Please Meet Your Service Provider", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    return
                }
                let alertController: UIAlertController = UIAlertController(title: "Success", message: "User Registration is Successful", preferredStyle: .alert)
                
                let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "Allow_Location" )
                    vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                    self.navigationController?.pushViewController(vc,animated: true)
                }
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Password Didnt Match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // Do any additional setup after loading the view.
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
