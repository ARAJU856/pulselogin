//
//  ViewController.swift
//  pulselogin
//
//  Created by A RAJU on 11/5/19.
//  Copyright © 2019 A RAJU. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var URLReqObj:URLRequest!
    var dataTaskObj:URLSessionDataTask!

    
    var converterData:[String]!

    
    @IBAction func loginBtn(_ sender: Any) {
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentLogIn(registeredEmail: "avularaju9866@gmail.com", registeredPassword: "9866132612", funcName: "verifyLogin")
    emailTF.delegate = self
   passwordTF.delegate = self
        
    }
    
    //  displaying the student login details
    
    func studentLogIn(registeredEmail: String,registeredPassword: String,funcName: String) // function with parameters
    {
        
        URLReqObj = URLRequest(url: URL(string: "https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php?")!)
        
        URLReqObj.httpMethod = "POST"   // storing in the post
        
        // sending the data
        
        var dataToSend = "registeredEmail=avularaju9866@gmail.com&registeredPassword=9866132612&funcName=verifyLogin"
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)    // url request
        
        // gettintg data from server
        
        dataTaskObj =  URLSession.shared.dataTask(with: URLReqObj, completionHandler: { data,connDetails,error in
            
            print("recevied data from server")   // receving the data from server
            
            do
            {
                var converterData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:String] // converting code from jsonserialization to swift
                print(converterData)
            }
            catch
            {
                print("something went wrong")
                
            }
            
        })
        dataTaskObj.resume()      // resuming the code
        
        
    }
    var returnvalue:Bool = true
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
        
    {
        
        if(textField == emailTF)
        {
            return true
        }
        
        if (textField == passwordTF)
        {
            if(passwordTF.text!.count > 1 )
            {
                return true
            }else
                
            {
                return  returnvalue
            }
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField .backgroundColor = UIColor.gray
        if( emailTF.text != "" && passwordTF.text != "")
        {
          
        } else {
           
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        textField .backgroundColor = UIColor.white

        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        

    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason)
    {
    
    }
    
  
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
       
        var emailCharacterSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@. ")
        if(textField == emailTF)
        {
            if((string.rangeOfCharacter(from: emailCharacterSet)) != nil || string == "")
            {
                return true
            }else
            {
                return false
            }
            var passwordCharacterSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@. ")
            if(textField == passwordTF)
            {
                if((string.rangeOfCharacter(from: passwordCharacterSet)) != nil || string == "")
                {
                    return true
                }else
                {
                    return false
                }
            }
            return true
            
        }
        return true
        
        
        
    }
    
    
    
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.text = ""
        return true
    }
  
    
 


}

