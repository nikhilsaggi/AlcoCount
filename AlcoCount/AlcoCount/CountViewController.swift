//
//  FirstViewController.swift
//  AlcoCount
//
//  Created by David Schwardt on 5/4/18.
//  Copyright © 2018 David Schwardt. All rights reserved.
//

import UIKit
import BAFluidView



class CountViewController: UIViewController, saveButtonDelegate, submitButtonDelegate{
    
    var singdigitSize = CGFloat(250)
    var dubdigitSize = CGFloat(155)
    
    var username: String!
    
    var drinkCount: Int = 0
    var BACpd: Float = 0.026
    var countLabel: UILabel!
    var tapGesture = UITapGestureRecognizer()
    var undoButton: UIButton!
    var welcomeMessage1: UILabel!
    var welcomeMessage2: UILabel!
    var welcomeText1 = "Tap to start"
    var welcomeText2 = "counting"
    
    
    var fluidView: BAFluidView!
    var fluidFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "AlcoCount"
        view.backgroundColor = UIColor(red: 42/255, green: 45/255, blue: 58/255, alpha: 1.0)
        
        var thirdTab = self.tabBarController!.viewControllers![2] as! BioViewController
        thirdTab.delegate = self
        
        var fourthTab = self.tabBarController!.viewControllers![3] as! YoViewController
        fourthTab.delegate = self
        
        countLabel = UILabel()
        countLabel.text = String(drinkCount)
        countLabel.font = .systemFont(ofSize: singdigitSize)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.textColor = .white
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(CountViewController.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        
        undoButton = UIButton()
        
        undoButton.backgroundColor = UIColor(red: 42/255, green: 45/255, blue: 58/255, alpha: 1.0)
        undoButton.setTitleColor(.white, for: .normal)
        undoButton.layer.cornerRadius = 10
        undoButton.addTarget(self, action: #selector(undoButtonPressed), for: .touchUpInside) //later
        undoButton.translatesAutoresizingMaskIntoConstraints = false
        undoButton.setImage(#imageLiteral(resourceName: "Redo"), for: .normal)
        
        welcomeMessage1 = UILabel()
        welcomeMessage1.text = welcomeText1
        welcomeMessage1.font = .systemFont(ofSize: 36)
        welcomeMessage1.translatesAutoresizingMaskIntoConstraints = false
        welcomeMessage1.textColor = .white
        
        welcomeMessage2 = UILabel()
        welcomeMessage2.text = welcomeText2
        welcomeMessage2.font = .systemFont(ofSize: 36)
        welcomeMessage2.translatesAutoresizingMaskIntoConstraints = false
        welcomeMessage2.textColor = .white
        
        fluidView = BAFluidView(frame: fluidFrame, maxAmplitude: 25, minAmplitude: 20, amplitudeIncrement: 1, startElevation: 0.0)
//        fluidView.backgroundColor = .blue
        fluidView.fillAutoReverse = false
        fluidView.fillDuration = 7
        fluidView.strokeColor = .blue
        fluidView.fillRepeatCount = 1
        fluidView.fillColor = .blue
        fluidView.fill(to: 0.0)

        view.addSubview(fluidView)
        view.addSubview(countLabel)
        view.addSubview(undoButton)
        view.addSubview(welcomeMessage1)
        view.addSubview(welcomeMessage2)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -190 ),
            countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            countLabel.heightAnchor.constraint(equalToConstant: 212)
            ])
        
        NSLayoutConstraint.activate([
            undoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            undoButton.widthAnchor.constraint(equalToConstant: 56),
            undoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            undoButton.heightAnchor.constraint(equalToConstant: 56)
            ])
        
        NSLayoutConstraint.activate([
            welcomeMessage1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeMessage1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90),
            welcomeMessage1.heightAnchor.constraint(equalToConstant: 48)
            ])
        
        NSLayoutConstraint.activate([
            welcomeMessage2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeMessage2.topAnchor.constraint(equalTo: welcomeMessage1.bottomAnchor),
            welcomeMessage2.heightAnchor.constraint(equalToConstant: 48)
            ])
        
        
    }
    
    func getAPI() {
        var request = NSMutableURLRequest(url: URL(string: "http://api.justyo.co/yo/")!)
        // Set params to be sent to the server
        var params = "69617c90-4bc1-4d2c-a56d-08f99ee0f765=<token>&username=" + username
        
        // Encoding type
        var data: Data? = params.data(using: String.Encoding.utf8)
    }
    
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        welcomeText1 = ""
        welcomeText2 = ""
        welcomeMessage1.text = welcomeText1
        welcomeMessage2.text = welcomeText2
        
        drinkCount = drinkCount + 1
        countLabel.text = String(drinkCount)
        if (drinkCount > 9){
            countLabel.font = .systemFont(ofSize: dubdigitSize)
        }else{
            countLabel.font = .systemFont(ofSize: singdigitSize)
        }
        
        let BAC = BACpd * Float(drinkCount)
        
        if(BAC < 0.04){
            fluidView.fillColor = UIColor(red: 148/255, green: 255/255, blue: 91/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 148/255, green: 255/255, blue: 91/255, alpha: 1.0)
        }
        if(0.04 < BAC && BAC < 0.07){
            fluidView.fillColor = UIColor(red: 181/255, green: 252/255, blue: 143/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 181/255, green: 252/255, blue: 143/255, alpha: 1.0)
        }
        if(0.07 < BAC && BAC < 0.10){
            fluidView.fillColor = UIColor(red: 248/255, green: 252/255, blue: 143/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 248/255, green: 252/255, blue: 143/255, alpha: 1.0)
        }
        if(0.10 < BAC && BAC < 0.15){
            fluidView.fillColor = UIColor(red: 241/255, green: 247/255, blue: 84/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 241/255, green: 247/255, blue: 84/255, alpha: 1.0)
        }
        if(0.15 < BAC && BAC < 0.19){
            fluidView.fillColor = UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0)
            if(username != nil){
                getAPI()
            }
        }
        if(0.19 < BAC && BAC < 0.24){
            fluidView.fillColor = UIColor(red: 252/255, green: 130/255, blue: 42/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0)
        }
        if(0.24 < BAC && BAC < 0.30){
            fluidView.fillColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
        if(BAC > 0.3){
            fluidView.fillColor = UIColor(red: 175/255, green: 0/255, blue: 0/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 175/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
        
        
        let fillHeight = NSNumber(value: Float(drinkCount) * 0.077)
        fluidView.fill(to: fillHeight)
        
        
        
        
    }
    
    @objc func undoButtonPressed(sender: UIButton) {
        if (drinkCount > 0){
            drinkCount = drinkCount - 1
        }
        if (drinkCount == 0){
            welcomeText1 = "Tap to start"
            welcomeText2 = "counting"
            welcomeMessage1.text = welcomeText1
            welcomeMessage2.text = welcomeText2
        }
        
        countLabel.text = String(drinkCount)
        if (drinkCount > 9){
            countLabel.font = .systemFont(ofSize: dubdigitSize)
        }else{
            countLabel.font = .systemFont(ofSize: singdigitSize)
        }
        let BAC = BACpd * Float(drinkCount)
        
        if(BAC < 0.04){
            fluidView.fillColor = UIColor(red: 148/255, green: 255/255, blue: 91/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 148/255, green: 255/255, blue: 91/255, alpha: 1.0)
        }
        if(0.04 < BAC && BAC < 0.07){
            fluidView.fillColor = UIColor(red: 181/255, green: 252/255, blue: 143/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 181/255, green: 252/255, blue: 143/255, alpha: 1.0)
        }
        if(0.07 < BAC && BAC < 0.10){
            fluidView.fillColor = UIColor(red: 248/255, green: 252/255, blue: 143/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 248/255, green: 252/255, blue: 143/255, alpha: 1.0)
        }
        if(0.10 < BAC && BAC < 0.15){
            fluidView.fillColor = UIColor(red: 241/255, green: 247/255, blue: 84/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 241/255, green: 247/255, blue: 84/255, alpha: 1.0)
        }
        if(0.15 < BAC && BAC < 0.19){
            fluidView.fillColor = UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0)
        }
        if(0.19 < BAC && BAC < 0.24){
            fluidView.fillColor = UIColor(red: 252/255, green: 130/255, blue: 42/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0)
        }
        if(0.24 < BAC && BAC < 0.30){
            fluidView.fillColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
        if(BAC > 0.3){
            fluidView.fillColor = UIColor(red: 175/255, green: 0/255, blue: 0/255, alpha: 1.0)
            fluidView.strokeColor = UIColor(red: 175/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
        
        
        let fillHeight = NSNumber(value: Float(drinkCount) * 0.077)
        fluidView.fill(to: fillHeight)
    }
    
    func saveButtonPressed(withName bac: Float){
        BACpd = bac
    }
    
    func submitButtonPressed(withName user: String){
        username = user
    }

  


}

