//
//  EntryViewController.swift
//  AlcoCount
//
//  Created by David Schwardt on 5/5/18.
//  Copyright © 2018 David Schwardt. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    
    let reuseCell = "reuseCell"
   
    var entry1 = Entry(range: "0.0% to 0.04%", blurb: "Lightheaded - Relaxation, sensation of warmth, minor impairment of judgement.", color: UIColor(red: 148/255, green: 255/255, blue: 91/255, alpha: 1.0))
    var entry2 = Entry(range: "0.05% to 0.07%", blurb: "Buzzed - Relaxation, euphoria, minor impairment of reasoning and memory, exageratted emotions", color: UIColor(red: 181/255, green: 252/255, blue: 143/255, alpha: 1.0))
    var entry3 = Entry(range: "0.07% to 0.10%", blurb: "Legally Impaired - Euphoria, fatigue, impairment in balance, speech, vision, reaction time and hearing. Self-control impaired", color: UIColor(red: 248/255, green: 252/255, blue: 143/255, alpha: 1.0))
    var entry4 = Entry(range: "0.10% to 0.15%", blurb: "Drunk - reduced and depressed effects. Anxiety, depression or unease more pronounced, gross motor impairment. Judgement and perception severely impaired", color: UIColor(red: 241/255, green: 247/255, blue: 84/255, alpha: 1.0))
    var entry5 = Entry(range: "0.15% to 0.19%", blurb: "Very Drunk - Strong state of depression, nausea, disorientation, dizzy, increased motor impairment, blurred vision, judgement further impaired", color: UIColor(red: 247/255, green: 176/255, blue: 84/255, alpha: 1.0))
    var entry6 = Entry(range: "0.19% to 0.24%", blurb: "Dazed and Confused - Gross disorientation to time and place, increased nausea and vomitting, may need assistance to stand/walk, blackout likely", color: UIColor(red: 252/255, green: 130/255, blue: 42/255, alpha: 1.0))
    var entry7 = Entry(range: "0.24% to 0.30%", blurb: "Stupor - All mental, physical and sensory functions are severly impaired, accidents ery likely, very little comprehension, may pass out suddenly", color: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0))
    var entry8 = Entry(range: "0.30% and up", blurb: "Coma - Level of surgical amnesia, onset of coma, possibility of acute alcohol poisoning, death due to respiratory arrest is likely in 50% of drinkers", color: UIColor(red: 175/255, green: 0/255, blue: 0/255, alpha: 1.0))
    
    var entries : [Entry] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "BAC"
        navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 147/255, blue: 97/255, alpha: 1)
        entries.append(contentsOf: [entry1, entry2, entry3, entry4, entry5, entry6, entry7, entry8])

        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        //rgb(200, 204, 179)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        
        collectionView.register(EntryCollectionViewCell.self, forCellWithReuseIdentifier: reuseCell)
        
        view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath) as! EntryCollectionViewCell
        
        let range = entries[indexPath.row].range
        let blurb = entries[indexPath.row].blurb
        let color = entries[indexPath.row].color
        
        cell.rangeLabel.text = range
        cell.blurbLabel.text = blurb
        cell.backgroundColor = color
        
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }
    
    //Functions in delegateFlowLayout protocol that gives us functionality to flesh out our design
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 75)
    }
    
}
