//
//  ViewController.swift
//  TableViewApp
//
//  Created by 西谷恭紀 on 2019/06/05.
//  Copyright © 2019 西谷恭紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "memo") != nil {
            
            resultArray = UserDefaults.standard.object(forKey: "memo") as! [String]
            
        }
        
        //再度デリゲートメソッドが全て呼ばれる
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath )
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //もしeditingStyleが配列のCellのスライドされた番号を消去する
        if editingStyle == .delete{
        //indexPath.rowで認識された場所と同じ場所で削除の処理が実行する
            resultArray.remove(at: indexPath.row)
            
            UserDefaults.standard.set(resultArray, forKey: "memo")
            
            tableView.reloadData()
        }
        
        
    }
    
    
}

