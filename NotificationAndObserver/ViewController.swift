//
//  ViewController.swift
//  NotificationAndObserver
//
//  Created by Mac on 17.01.2022.
//

import UIKit
let lightNotificationKey = "com.lightsideselected"
let darkNotificationKey = "com.darksideselected"


class ViewController: UIViewController {

    @IBOutlet weak var resultSideButon: UIButton!
        let light = Notification.Name(rawValue: lightNotificationKey)
        let dark = Notification.Name(rawValue: darkNotificationKey)
    
    deinit{
       //remove notification before class deallocated
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        creataObservers()
    }
    func creataObservers(){
        //lightSide
        NotificationCenter.default.addObserver(self, selector: #selector(updateButtonForlightSide), name: light, object: nil)
        //DarkSide
        NotificationCenter.default.addObserver(self, selector: #selector(updateButtonForDarkSide), name: dark , object: nil)
    }
    @objc  func updateButtonForlightSide(notification:Notification) {
       // let isLight = notification.name == light we can use this if we want or not
    resultSideButon.backgroundColor = .white
    resultSideButon.setTitle("You Chosed Light Side", for: .normal)
    resultSideButon.tintColor = .black
    }
    @objc  func updateButtonForDarkSide(){
        resultSideButon.backgroundColor = .black
        resultSideButon.setTitle("You Chosed Dark Side", for: .normal)
        resultSideButon.tintColor = .white
    }
    @IBAction func resultSideButonPressed(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(identifier: "SelectionVC") as! SelectionViewController
        present(selectionVC, animated: true, completion: nil)
    }
    
}

