//
//  YoViewController.swift
//  AlcoCount
//
//  Created by Nikhil Saggi on 5/5/18.
//  Copyright © 2018 Nikhil Saggi. All rights reserved.
//

import UIKit

protocol submitButtonDelegate {
    func submitButtonPressed(withName user:String)
}

class YoViewController: UIViewController {
    
    var yoBar: UIView!
    var yoBarLabel: UILabel!
    var yoLogo: UIView!
    var inactiveColor: UIColor!
    var activeColor: UIColor!
    var bgColor: UIColor!
    var infoLabel: UILabel!
    var infoLabel2: UILabel!
    var infoLabel3: UILabel!
    var userLabel: UILabel!
    var userField: UITextField!
    var submitButton: UIButton!
    var underline: UIView!
    
    var delegate: submitButtonDelegate?
    // let image = UIImage(named: "yo-1.svg")
    // var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Yo"
        
        inactiveColor = UIColor(red: 226/255, green: 196/255, blue: 170/255, alpha: 1)
        activeColor = UIColor(red: 203/255, green: 147/255, blue: 97/255, alpha: 1)
        bgColor = UIColor(red: 42/255, green: 45/255, blue: 58/255, alpha: 1)
        
        view.backgroundColor = bgColor
        
        yoBar = UIView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/13))
        yoBar.backgroundColor = UIColor(red: 155/255, green: 90/255, blue: 182/255, alpha: 1)
        view.addSubview(yoBar)
        
        yoBarLabel = UILabel()
        yoBarLabel.text = "Powered by Yo"
        yoBarLabel.textColor = .white
        yoBarLabel.font = UIFont(name: ".SFUIText-Medium", size: 24)!
        yoBarLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yoBarLabel)
        
        infoLabel = UILabel()
        infoLabel.text = "Give us your Yo\nusername and we'll\nYo you when you're"
        infoLabel.textColor = .white
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont(name: ".SFUIText-Medium", size:24)!
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)
        
        infoLabel2 = UILabel()
        infoLabel2.text = "Very Drunk"
        infoLabel2.textColor = UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0)
        infoLabel2.textAlignment = .center
        infoLabel2.font = UIFont(name: ".SFUIText-Medium", size:24)!
        infoLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel2)
        
        infoLabel3 = UILabel()
        infoLabel3.text = "!"
        infoLabel3.textColor = .white
        infoLabel3.textAlignment = .center
        infoLabel3.font = UIFont(name: ".SFUIText-Medium", size:24)!
        infoLabel3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel3)
        
        userLabel = UILabel()
        userLabel.text = "Username"
        userLabel.textColor = .white
        userLabel.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userLabel)
        
        userField = UITextField()
        userField.textColor = .white
        userField.layer.cornerRadius = 18
        userField.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        userField.backgroundColor = UIColor(white: 0, alpha: 0)
        userField.textAlignment = .center
        userField.autocorrectionType = UITextAutocorrectionType(rawValue: 0)!
        userField.autocapitalizationType = UITextAutocapitalizationType(rawValue: 0)!
        userField.addTarget(self, action: #selector(clickedText), for: UIControlEvents.allEvents)
        userField.addTarget(self, action: #selector(changedText), for: UIControlEvents.editingChanged)
        userField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userField)
        
        submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont(name: ".SFUIText-Medium", size: 24)!
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        submitButton.backgroundColor = inactiveColor
        submitButton.isEnabled = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        setupConstraints()
        
        underline = UIView(frame: CGRect(x: 55, y: 450, width: 300, height: 2))
        underline.backgroundColor = activeColor
        view.addSubview(underline)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            yoBarLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
            yoBarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoLabel2.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),
            infoLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoLabel3.topAnchor.constraint(equalTo: infoLabel2.topAnchor),
            infoLabel3.leadingAnchor.constraint(equalTo: infoLabel2.trailingAnchor),
            
            userLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 80),
            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 8),
            userField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            userField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            submitButton.topAnchor.constraint(equalTo: userField.bottomAnchor, constant: 64),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120)
            ])
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clickedText() {
        userLabel.textColor = .white
        userField.textColor = .white
        underline.backgroundColor = activeColor
    }
    
    @objc func changedText() {
        submitButton.backgroundColor = activeColor
        submitButton.isEnabled = true
    }
    
    @objc func submitButtonPressed() {
        submitButton.backgroundColor = inactiveColor
        submitButton.isEnabled = false
        userLabel.textColor = .gray
        userField.textColor = .gray
        underline.backgroundColor = inactiveColor
        
        if let user = userField.text{
            delegate?.submitButtonPressed(withName: user)
        }
        
    }
    
    
    
    
    
}
