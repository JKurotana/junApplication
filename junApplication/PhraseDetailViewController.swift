//
//  PhraseDetailViewController.swift
//  junApplication
//
//  Created by JUN TANAKA on 2017/04/10.
//  Copyright © 2017年 JUN TANAKA. All rights reserved.
//

import UIKit

class PhraseDetailViewController: UIViewController {

    @IBOutlet weak var myPhrase: UILabel!
    //選択されたエリア名
    var selectName = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("selectName----------------------------")
        print(selectName)
        
        myPhrase.text = selectName
        // プロパティリストのファイルパスを取得
        let filePath = Bundle.main.path(forResource:"Phraselist", ofType: "plist")
        // プロパティリストからデータを取得（デｲクショナリー型）
        let dic = NSDictionary(contentsOfFile: filePath!)
        // TableViewで扱いやすい配列（エリア名の入ってる配列）を作成
        for(key,data) in dic!{
            print(data)
            
            
            print("Key----------------------------")
            print(key)
            //dictionary型に変換
            
            
            var dic1:NSDictionary = data as! NSDictionary
            
            
            for(key1,data1) in dic1 {
                
                print("data1----------------------------")
                print(key1)
                print(data1)
                var dic2:NSDictionary = data1 as! NSDictionary
                
                
                for(key2,data2) in dic2 {
                    print("data2----------------------------")
                    print(key2)
                    print(data2)
                    
                    if ((key as! String) == selectName){
                        
                        if ((key2 as! String) == "phrase"){
                            
                            
                        }
                        
                    }
                    
                                        
                    
                    
                    
                }
                
                
                
                
            }
            
        
        
        
        
        
        }
        
        
        
        
        
        
        


    }

    
    //スピーカーボタンが押された時
    @IBAction func mybtnSpeaker(_ sender: UIButton) {
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
