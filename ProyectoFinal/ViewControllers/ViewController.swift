//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by Diego Escobedo on 11/15/22.
//  Copyright © 2022 Diego. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FirebaseDatabase

class ViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = "106943513611-929auup6gdq8p6hdnjgl9g0ivrjkqm0v.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }
    @IBAction func IniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presente el siguiente error: \(error)")
                
            }else{
                print("Se inicio Sesion")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    @IBAction func registrarseTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presente el siguiente error: \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in print("Intentando crear usuario")
                    if error != nil{
                        print("No se pudo crear usuario: \(error)")
                    }else{
                        print("Se creo el usuario exitosamente")
                        Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("Se inicio Sesion")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("User email: \(user.profile.email ?? "No Email")")
        
        Database.database().reference().child("usuarios").child(user.userID).child("email").setValue(user.profile.email)
        
        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
        
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    

}

