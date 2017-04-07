//
//  ViewController.swift
//  junApplication
//
//  Created by JUN TANAKA on 2017/03/27.
//  Copyright © 2017年 JUN TANAKA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            // 次の画面のオブジェクトを作成
            let secondVC = segue.destination as!
            PhraseListViewController
        
            // 次の画面のプロパティに選択されたエリア名を設定
            secondVC.selectName = segue.identifier!
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


