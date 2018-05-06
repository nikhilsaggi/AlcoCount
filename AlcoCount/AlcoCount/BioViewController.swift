//
//  ViewController.swift
//  AlcoCount
//
//  Created by Nikhil Saggi on 5/4/18.
//  Copyright © 2018 Nikhil Saggi. All rights reserved.
//

import UIKit


protocol saveButtonDelegate {
    func saveButtonPressed(withName bac:Float)
}

class BioViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var bgColor: UIColor!
    var activeColor: UIColor!
    var inactiveColor: UIColor!
    // var titleView: UIView!
    // var titleLabel: UILabel!
    var ageLabel: UILabel!
    var genderLabel: UILabel!
    var weightLabel: UILabel!
    var lbsLabel: UILabel!
    var ageField: UITextField!
    var genderPicker: UIPickerView!
    var genders: [String] = [String]()
    var genderField: UITextField!
    var weightField: UITextField!
    var saveButton: UIButton!
    var delegate: saveButtonDelegate?
    var underline: UIView!
    var underline2: UIView!
    var underline3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inactiveColor = UIColor(red: 226/255, green: 196/255, blue: 170/255, alpha: 1)
        activeColor = UIColor(red: 203/255, green: 147/255, blue: 97/255, alpha: 1)
        bgColor = UIColor(red: 42/255, green: 45/255, blue: 58/255, alpha: 1)
        
        view.backgroundColor = bgColor
        
        /*
         titleView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8))
         titleView.backgroundColor = activeColor
         titleView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(titleView)
         
         titleLabel = UILabel()
         titleLabel.textColor = .white
         titleLabel.text = "Your Details"
         titleLabel.font = UIFont(name: ".SFUIText-Medium", size: 36)!
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(titleLabel)
         */
        
        ageLabel = UILabel()
        ageLabel.textColor = .white
        ageLabel.text = "Age"
        ageLabel.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageLabel)
        
        genderLabel = UILabel()
        genderLabel.textColor = .white
        genderLabel.text = "Gender"
        genderLabel.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderLabel)
        
        weightLabel = UILabel()
        weightLabel.textColor = .white
        weightLabel.text = "Weight"
        weightLabel.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightLabel)
        
        lbsLabel = UILabel()
        lbsLabel.textColor = .white
        lbsLabel.text = " lbs"
        lbsLabel.font = UIFont(name: ".SFUIText-Medium", size: 24)!
        lbsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lbsLabel)
        
        ageField = UITextField()
        ageField.textColor = .white
        ageField.layer.cornerRadius = 18
        ageField.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        ageField.backgroundColor = UIColor(white: 0, alpha: 0)
        ageField.textAlignment = .center
        ageField.addTarget(self, action: #selector(clickedText), for: UIControlEvents.allEvents)
        ageField.addTarget(self, action: #selector(changedText), for: UIControlEvents.editingChanged)
        ageField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageField)
        
        genderPicker = UIPickerView()
        genders = ["Male", "Female", "Other"]
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        genderField = UITextField()
        genderField.textColor = .white
        genderField.layer.cornerRadius = 18
        genderField.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        genderField.backgroundColor = UIColor(white: 0, alpha: 0)
        genderField.textAlignment = .center
        genderField.inputView = genderPicker
        genderField.addTarget(self, action: #selector(clickedText), for: UIControlEvents.allEvents)
        genderField.addTarget(self, action: #selector(changedText), for: UIControlEvents.editingChanged)
        genderField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderField)
        
        weightField = UITextField()
        weightField.textColor = .white
        weightField.layer.cornerRadius = 18
        weightField.font = UIFont(name: ".SFUIText-Medium", size: 36)!
        weightField.backgroundColor = UIColor(white: 0, alpha: 0)
        weightField.textAlignment = .right
        weightField.addTarget(self, action: #selector(clickedText), for: UIControlEvents.allEvents)
        weightField.addTarget(self, action: #selector(changedText), for: UIControlEvents.editingChanged)
        weightField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightField)
        
        saveButton = UIButton()
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.titleLabel?.font = UIFont(name: ".SFUIText-Medium", size: 16)!
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        saveButton.backgroundColor = inactiveColor
        saveButton.isEnabled = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        setupConstraints()
        
        underline = UIView(frame: CGRect(x: 150, y: 255, width: 120, height: 2))
        underline.backgroundColor = activeColor
        view.addSubview(underline)
        
        underline2 = UIView(frame: CGRect(x: 150, y: 405, width: 120, height: 2))
        underline2.backgroundColor = activeColor
        view.addSubview(underline2)
        
        underline3 = UIView(frame: CGRect(x: 150, y: 550, width: 75, height: 2))
        underline3.backgroundColor = activeColor
        view.addSubview(underline3)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height/16 - 18),
            
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            
            ageField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 16),
            ageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            ageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderLabel.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 48),
            
            genderField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 16),
            genderField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            genderField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            
            weightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightLabel.topAnchor.constraint(equalTo: genderField.bottomAnchor, constant: 48),
            
            weightField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 16),
            weightField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            weightField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -192),
            
            lbsLabel.bottomAnchor.constraint(equalTo: weightField.bottomAnchor),
            lbsLabel.leadingAnchor.constraint(equalTo: weightField.trailingAnchor, constant: 4),
            
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -96),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120)
            ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func saveButtonPressed() {
        var gender: Float!
        var weight: Float!
        
        if Int(ageField.text!) == nil {
            let age = 20
        } else {
            let age = Int(ageField.text!)
        }
        
        switch genderField.text! {
        case "Male":
            gender = 0.73
        case "Female":
            gender = 0.66
        default:
            gender = 0.695
        }
        
        if Int(ageField.text!) == nil {
            weight = 168.5
        } else {
            weight = Float(weightField.text!)
        }
        
        let bac = 3.084/(weight*gender)
        
        saveButton.backgroundColor = inactiveColor
        saveButton.isEnabled = false
        ageLabel.textColor = .gray
        genderLabel.textColor = .gray
        weightLabel.textColor = .gray
        ageField.textColor = .gray
        genderField.textColor = .gray
        weightField.textColor = .gray
        lbsLabel.textColor = .gray
        underline.backgroundColor = inactiveColor
        underline2.backgroundColor = inactiveColor
        underline3.backgroundColor = inactiveColor
        
        delegate?.saveButtonPressed(withName: bac)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    @objc func changedText() {
        saveButton.backgroundColor = activeColor
        saveButton.isEnabled = true
    }
    
    @objc func clickedText() {
        ageLabel.textColor = .white
        ageField.textColor = .white
        underline.backgroundColor = activeColor
        
        genderLabel.textColor = .white
        genderField.textColor = .white
        underline2.backgroundColor = activeColor
        
        weightLabel.textColor = .white
        weightField.textColor = .white
        lbsLabel.textColor = .white
        underline3.backgroundColor = activeColor
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            genderField.text = "Male"
        case 1:
            genderField.text = "Female"
        case 2:
            genderField.text = "Other"
        default:
            break
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    
}


