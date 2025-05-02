import UIKit

class LogInPageController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Вход", subTitle: "Введите адрес электронной почты, \nуказанный при регистрации")
    
    private let usernameField = CustomTextField(authFieldType: .username)
    private let passwordField = CustomTextField(authFieldType: .password)
    
    private let logInButton = CustomButton(title: "Log In", hasBackground: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setUp() {
        self.view.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 250),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 44),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 56),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 10),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 56),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
}
