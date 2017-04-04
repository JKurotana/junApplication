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
    var PhraseList:[String] = []
    //選択されたエリア名
    var selectName = ""

    @IBOutlet weak var JunTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // プロパティリストのファイルパスを取得
        let filePath = Bundle.main.path(forResource:"Phraselist", ofType: "plist")
        // プロパティリストからデータを取得（デｲクショナリー型）
        let dic = NSDictionary(contentsOfFile: filePath!)
        // TableViewで扱いやすい配列（エリア名の入ってる配列）を作成
        for(key,data) in dic!{
            PhraseList.append(key as! String)
        }
        
        print(PhraseList)
        

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhraseList.count
    }
    
    // ③リストに表示を文字を決定し、表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 文字を表示するセルの取得
        let cell =
            tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        // 表示文字の設定
        cell.textLabel?.text = PhraseList[indexPath.row]
        
        //        cell.textLabel?.textColor = UIColor.blue
        
        return cell
    }

    // セルが選択された時発動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //選択された行に表示されている名前を格納
        selectName = PhraseList[indexPath.row] as String
        //セグエを指定して画面遷移
        performSegue(withIdentifier: "showSecondView", sender: nil)
    }
    
    // 画面遷移する時に、次の画面へエリア名を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面のオブジェクトを作成
        
        //let secondVC = segue.destination;as PhraseViewController
        
        // 次の画面のプロパティに選択されたエリア名を設定
        //secondVC.scSelectName = selectName
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
