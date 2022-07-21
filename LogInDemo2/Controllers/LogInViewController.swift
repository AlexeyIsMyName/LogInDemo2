//
//  LogInViewController.swift
//  LogInDemo
//
//  Created by ALEKSEY SUSLOV on 15.07.2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        print("view controllers")
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                print("welcomVC")
                welcomeVC.person = user.person
            }
            
            if let jobVC = viewController as? JobViewController {
                print("jobVC")
                jobVC.job = user.person.job
            }
            
            if let hobbyVC = viewController as? HobbyViewController {
                print("hobbyVC")
                hobbyVC.hobby = user.person.hobby
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user.name || passwordTextField.text != user.password {
            showAlert(title: "Invalid login or password",
                      message: "please enter correct login and password") { _ in
                self.passwordTextField.text = nil
            }
        } else {
            performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        var message = "Your name is \(user.name)"
        
        if sender.tag == 1 {
            message = "Your password is \(user.password)"
        }
        
        showAlert(title: "Ooops!", message: message)
    }
}

// MARK: - Alert Controller
extension LogInViewController {
    private func showAlert(title: String,
                           message: String,
                           buttonHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK",
                                        style: .default,
                                        handler: buttonHandler)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
}

// MARK: - TextField Delegate Methods
extension LogInViewController: UITextFieldDelegate {
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
