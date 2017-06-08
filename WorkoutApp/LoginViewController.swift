//
//  LoginViewController.swift
//  WorkoutApp
//
//  Created by Rana on 6/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var inputEmail : UITextField!
    @IBOutlet var inputPassword : UITextField!
    @IBOutlet var loginButton : UIButton!
    var login_session:String = ""
    let login_url = "http://localhost:3000/users"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputEmail.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LoginButton(_ sender: Any) {
        
        let _email = inputEmail.text
        let _password = inputPassword.text
        
        if(_email == "" || _password == ""){
            return
        }
        
        print("Login Clicked")
        DoLogin(_email! , _password!)
        
        
    }
    
    
    func DoLogin(_ username: String, _ password: String){
        
        //Create a POST request with user info
        //If the data checks out the server will respond with a success code (200) and user token/session
        //Else the server will respond with nil
        
        print("DoLogin started")
        let post_data: NSDictionary = NSMutableDictionary()
        
        post_data.setValue(username, forKey: "username")
        post_data.setValue(password, forKey: "password")
        
        
        
        let url:URL = URL(string: login_url)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        var paramString = ""
        
        
        for (key, value) in post_data
        {
            paramString = paramString + (key as! String) + "=" + (value as! String) + "&"
        }
        
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        print("Request created")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            ( data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                
                return
            }
        
            print("Data = " , data)
            let json: Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            
            print("JSON = " , json)
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            //Replace this line with block of code below when server is initialized
            DispatchQueue.main.async(execute: self.LoginDone)
            
//            if let data_block = server_response["data"] as? NSDictionary
//            {
//                if let session_data = data_block["session"] as? String
//                {
//                    self.login_session = session_data
//                    
//                    let preferences = UserDefaults.standard
//                    preferences.set(session_data, forKey: "session")
//                    
//                    DispatchQueue.main.async(execute: self.LoginDone)
//                }
//            }
            
            
            
        })
        
        task.resume()
        print("Task resumed")
       
    }
    
    func LoginDone(){
        
        //Redirect to tabbed pages -> Nesreen
        print("LOGINNNNN")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
