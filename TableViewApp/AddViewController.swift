//
//  AddViewController.swift
//  TableViewApp
//
//  Created by 西谷恭紀 on 2019/06/05.
//  Copyright © 2019 西谷恭紀. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self

    }
    @IBAction func addText(_ sender: UIButton) {
        
        //現在の配列を配列を取り出す
        if (UserDefaults.standard.object(forKey: "memo") != nil) {
           array = UserDefaults.standard.object(forKey: "memo") as! [String]
        }
        
        array.append(textField.text!)
        UserDefaults.standard.set(array, forKey: "memo")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }

}
