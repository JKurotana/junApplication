//
//  PhraseListViewController.swift
//  junApplication
//
//  Created by JUN TANAKA on 2017/03/27.
//  Copyright © 2017年 JUN TANAKA. All rights reserved.
//

import UIKit

class PhraseListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
    {
    
   

    //プロパティリストから読み込んだデータを格納する配列
    var PhraseList:[NSDictionary] = []
    //選択されたエリア名
    var selectName = ""

    @IBOutlet weak var JunTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("selectName----------------------------")
        print(selectName)
        
        navigationItem.title = selectName
        
        
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
                
                if ((key as! String) == selectName){
                    
//                    myTranslation.text = dic2["translation"] as! String
                    
                    var Phrase = dic2["phrase"] as! String
                    
                    var translation = dic2["translation"] as! String

                    PhraseList.append(["phrase" : Phrase, "translation" : translation])
                
                
//                for(key2,data2) in dic2 {
//                print("data2----------------------------")
//                print(key2)
//                print(data2)
//                
//                    if ((key as! String) == selectName){
//                        
//                    if ((key2 as! String) == "phrase"){
//                    PhraseList.append(data2 as! String)
//                            
//                    }
//
//            }
                
                    print(PhraseList)
                    
                                        
                }
                    
            }
                
        }

    }
        
        
        
        
        
        

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhraseList.count
        }
    
    // ③リストに表示を文字を決定し、表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 文字を表示するセルの取得
        let cell =
            tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! CustomCell
        // 表示文字の設定
        
        var dic = PhraseList[indexPath.row]
        
//        cell.textLabel?.text = dic["phrase"] as! String
        
        cell.Phrase.text = dic["phrase"] as! String
        
        cell.translation.text = dic["translation"] as! String
        
        //        cell.textLabel?.textColor = UIColor.blue
        
        return cell
        }

    // セルが選択された時発動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //選択された行に表示されている名前を格納
        var dic = PhraseList[indexPath.row]
        
        selectName = dic["phrase"] as! String
        
        //セグエを指定して画面遷移
        performSegue(withIdentifier: "showSecondView", sender: nil)
        }
    
    // 画面遷移する時に、次の画面へエリア名を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        // 次の画面のオブジェクトを作成
        let secondVC = segue.destination as!
        PhraseDetailViewController

        
        //let secondVC = segue.destination;as PhraseViewController
        
        // 次の画面のプロパティに選択されたエリア名を設定
        secondVC.selectName = selectName

        //secondVC.scSelectName = selectName
        
        }
    override func didReceiveMemoryWarning(){
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
