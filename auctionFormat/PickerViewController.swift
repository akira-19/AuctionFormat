//
//  PickerViewController.swift
//  auctionFormat
//
//  Created by akira on 2018-03-14.
//  Copyright © 2018 akira. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
//    let dataList = [
//        ["ファッション" , "PC" , "スマホ" , "家電" , "CD"],
//        [ "XSサイズ" ,"Sサイズ" ,"Mサイズ" ,"Lサイズ" ,"LLサイズ" ,"XLサイズ" ,"3Lサイズ" ,"XXLサイズ" ,"自分で入力する"]
//    ]
    
    let dataList = [
        ["A1" , "A2" , "A3" , "A4" , "A5","A6"],
        [ "B1" ,"B2" ,"B3" ,"B4" ,"B5","B6" ,"B7" ,"B8" ,"B9"]
    ]
    
    
    
    var picker: String!
    var segueNum: Int!
    var selectedValue: String!
    
    // コンポーネントの個数を返すメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList[segueNum].count
    }
    
    // PickerViewに表示する配列の要素数を設定する
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[segueNum][row]
    }
    
    
    
//    //データ選択時の呼び出しメソッド
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        
//    }
    

    
    @IBAction func selectedValue(_ sender: Any) {
        selectedValue = dataList[segueNum][pickerView.selectedRow(inComponent: segueNum)]
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        

        // Do any additional setup after loading the view.
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
