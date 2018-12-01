//
//  NewTemplate.swift
//  auctionFormat
//
//  Created by akira on 2018-02-27.
//  Copyright © 2018 akira. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import GoogleMobileAds

class NewTemplate: UIViewController, UITextFieldDelegate {
    
 
     let SCREEN_SIZE = UIScreen.main.bounds.size
    var admobView = GADBannerView()
    var touchOrScrol = true
    
    //@IBOutlet weak var dummyView: UIView!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // 上部共通部分
      @IBOutlet weak var genre: UIButton!
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var tempTitle: UITextField!
    
    //ファッション
    @IBOutlet weak var fashionView: UIView!
    @IBOutlet weak var fashionViewHeight: NSLayoutConstraint!
    var fashionViewHeightInt: Int! // イニシャルの高さ
    
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var conditionButton: UIButton!
    
    @IBOutlet weak var product: UITextField!
    @IBOutlet weak var brand: UITextField!
    @IBOutlet weak var kitake: UITextField!
    @IBOutlet weak var katahaba: UITextField!
    @IBOutlet weak var mihaba: UITextField!
    @IBOutlet weak var sodetake: UITextField!
    
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var explain: UITextView!
    
    
    //スマホ、タブレット
    @IBOutlet weak var smartphoneView: UIView!
    @IBOutlet weak var smartphoneViewHeight: NSLayoutConstraint!
    var smartphoneViewHeightInt: Int!
    
    @IBOutlet weak var spColorButton: UIButton!
    @IBOutlet weak var spConditionButton: UIButton!
    
    @IBOutlet weak var spMaker: UITextField!
    @IBOutlet weak var spModel: UITextField!
    @IBOutlet weak var spSerialNum: UITextField!
    @IBOutlet weak var spExplain: UITextView!
    
    
    @IBOutlet weak var chargerCheck: CheckBox!
    @IBOutlet weak var earbudCheck: CheckBox!
    @IBOutlet weak var caseCheck: CheckBox!
    @IBOutlet weak var manualCheck: CheckBox!
    
    @IBAction func checkBox(_ sender: CheckBox) {
//        testButton.imageView?.contentMode = .scaleAspectFit
//        testButton.contentHorizontalAlignment = .fill
//        testButton.contentVerticalAlignment = .fill
    }
    
    
    //PC
    @IBOutlet weak var pcView: UIView!
    @IBOutlet weak var pcViewHeight: NSLayoutConstraint!
    var pcViewHeightInt: Int! // イニシャルの高さ
    @IBOutlet weak var pcMaker: UITextField!
    @IBOutlet weak var pcModel: UITextField!
    @IBOutlet weak var pcOS: UITextField!
    @IBOutlet weak var pcCPU: UITextField!
    @IBOutlet weak var pcMemory: UITextField!
    @IBOutlet weak var pcHDD: UITextField!
    @IBOutlet weak var pcMonitor: UITextField!
    @IBOutlet weak var pcExplain: UITextView!
    
    @IBOutlet weak var pcColorButton: UIButton!
    @IBOutlet weak var pcConditionButton: UIButton!
    
    //家電
    @IBOutlet weak var appView: UIView!
    @IBOutlet weak var appViewHeight: NSLayoutConstraint!
    var appViewHeightInt: Int! // イニシャルの高さ
    
    @IBOutlet weak var appColorButton: UIButton!
    @IBOutlet weak var appConditionButton: UIButton!
    @IBOutlet weak var appMaker: UITextField!
    @IBOutlet weak var appSerialNum: UITextField!
    @IBOutlet weak var appYear: UITextField!
    @IBOutlet weak var appMonth: UITextField!
    @IBOutlet weak var appAcc: UITextField!
    @IBOutlet weak var appExplain: UITextView!

    
    //DVD,Blu-ray
    @IBOutlet weak var dvdView: UIView!
    @IBOutlet weak var dvdViewHeight: NSLayoutConstraint!
    var dvdViewHeightInt: Int! // イニシャルの高さ
    @IBOutlet weak var dvdConditionButton: UIButton!
    @IBOutlet weak var dvdTitle: UITextField!
    @IBOutlet weak var dvdExplain: UITextView!

    
    //本、雑誌
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var bookViewHeight: NSLayoutConstraint!
    var bookViewHeightInt: Int! // イニシャルの高さ
    @IBOutlet weak var bookConditionButton: UIButton!
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var bookAuthor: UITextField!
    @IBOutlet weak var bookFirstVol: UITextField!
    @IBOutlet weak var bookSecVol: UITextField!
    @IBOutlet weak var bookExplain: UITextView!

    
    //その他
    @IBOutlet weak var othersView: UIView!
    @IBOutlet weak var othersViewHeight: NSLayoutConstraint!
    var othersViewHeightInt: Int! // イニシャルの高さ
    @IBOutlet weak var othersColorButton: UIButton!
    @IBOutlet weak var othersConditionButton: UIButton!
    @IBOutlet weak var othersProduct: UITextField!
    @IBOutlet weak var othersExplain: UITextView!

    
    //下部共通部分
    @IBOutlet weak var commonAreaView: UIView!
    @IBOutlet weak var commonAreaViewHeight: NSLayoutConstraint!
    var commonAreaViewHeightInt: Int! // イニシャルの高さ
    @IBOutlet weak var commonAreaShip: UIButton!
    @IBOutlet weak var commonAreaShipPrice: UITextField!
    
    @IBOutlet weak var ufjCheck: CheckBox!
    @IBOutlet weak var smbcCheck: CheckBox!
    @IBOutlet weak var yuuchoCheck: CheckBox!
    @IBOutlet weak var japanNetlCheck: CheckBox!
    @IBOutlet weak var yahooCheck: CheckBox!
    @IBOutlet weak var byMyselfCheck: CheckBox!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 以下バナー関連
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        
        
        
        self.admobView = GADBannerView(adSize:kGADAdSizeBanner)
        self.admobView.frame.origin = CGPoint(x:0, y:self.view.frame.size.height - admobView.frame.height)
        self.admobView.frame.size = CGSize(width:self.view.frame.width, height:admobView.frame.height)
        
        if ViewController.AdMobTest {
            admobView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        }
        else{
            admobView.adUnitID = ViewController.AdMobID
        }
        
        admobView.rootViewController = self
        admobView.load(GADRequest())
        
        self.view.addSubview(admobView)
        
        // NotificationCenter設定
        NotificationCenter.default.addObserver(self, selector: #selector(NewTemplate.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        //ここでUIKeyboardWillShowという名前の通知のイベントをオブザーバー登録をしている
        NotificationCenter.default.addObserver(self, selector: #selector(NewTemplate.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        //ここでUIKeyboardWillHideという名前の通知のイベントをオブザーバー登録をしている
        
        
        //place holder設定
        self.tempTitle.placeholder = "タイトルを入力してください。"

        // テキストエリアの背景色を設定
       self.textBox.layer.borderColor = UIColor.gray.cgColor
        self.textBox.layer.borderWidth = 1.0
        
        // 選択されていないジャンルのviewを隠す
        self.fashionView.isHidden = true
        self.smartphoneView.isHidden = true
        self.pcView.isHidden = true
        self.appView.isHidden = true
        self.dvdView.isHidden = true
        self.bookView.isHidden = true
        self.othersView.isHidden = true
        self.commonAreaView.isHidden = true

        
        // ジャンルごとのviewの高さを取得
        self.fashionViewHeightInt = Int(self.fashionView.bounds.height)
        self.smartphoneViewHeightInt = Int(self.smartphoneView.bounds.height)
        self.pcViewHeightInt = Int(self.pcView.bounds.height)
        self.appViewHeightInt = Int(self.appView.bounds.height)
        self.dvdViewHeightInt = Int(self.dvdView.bounds.height)
        self.bookViewHeightInt = Int(self.bookView.bounds.height)
        self.othersViewHeightInt = Int(self.othersView.bounds.height)
        self.commonAreaViewHeightInt = Int(self.commonAreaView.bounds.height)


        // 全てのジャンルのviewの高さを0にする
        self.fashionViewHeight.constant = 0
        self.smartphoneViewHeight.constant = 0
        self.pcViewHeight.constant = 0
        self.appViewHeight.constant = 0
        self.dvdViewHeight.constant = 0
        self.bookViewHeight.constant = 0
        self.othersViewHeight.constant = 0
        self.commonAreaViewHeight.constant = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
// PickerView-------------------------------------
    @IBAction func genrePick(_ sender: Any) {
        ActionSheetStringPicker.show(
            withTitle: "ジャンルの選択",
            rows: ["ジャンルを選択して下さい","ファッション", "スマホ、タブレット", "PC", "家電", "DVD、Blu-ray", "本、雑誌、漫画", "その他"],
            initialSelection: 0,
            doneBlock: {_, index, value  in
                self.genre.setTitle(value! as? String, for: .normal)
                
               // print(self.dummyView.bounds.height)
                
                // 全てのジャンルのviewを隠す
                self.fashionView.isHidden = true
                self.smartphoneView.isHidden = true
                self.pcView.isHidden = true
                self.appView.isHidden = true
                self.dvdView.isHidden = true
                self.bookView.isHidden = true
                self.othersView.isHidden = true
                self.commonAreaView.isHidden = true

                
                // 全てのジャンルのviewの高さを0にする
                self.fashionViewHeight.constant = 0
                self.smartphoneViewHeight.constant = 0
                self.pcViewHeight.constant = 0
                self.appViewHeight.constant = 0
                self.dvdViewHeight.constant = 0
                self.bookViewHeight.constant = 0
                self.othersViewHeight.constant = 0
                self.commonAreaViewHeight.constant = 0
                
                // ジャンルごとに表示、非表示
                if value as? String == "ファッション"{
                    self.fashionView.isHidden = false
                    self.commonAreaView.isHidden = false
                    self.fashionViewHeight.constant = CGFloat(self.fashionViewHeightInt)
                    self.commonAreaViewHeight.constant = CGFloat(self.commonAreaViewHeightInt)
                }else   if value as? String == "スマホ、タブレット"{
                    self.smartphoneView.isHidden = false
                    self.commonAreaView.isHidden = false
                    self.smartphoneViewHeight.constant = CGFloat(self.smartphoneViewHeightInt)
                     self.commonAreaViewHeight.constant = CGFloat(self.commonAreaViewHeightInt)
                }else   if value as? String == "PC"{
                    self.pcView.isHidden = false
                    self.commonAreaView.isHidden = false
                    self.pcViewHeight.constant = CGFloat(self.pcViewHeightInt)
                     self.commonAreaViewHeight.constant = CGFloat(self.commonAreaViewHeightInt)
                }else   if value as? String == "家電"{
                    self.appView.isHidden = false
                    self.commonAreaView.isHidden = false
                    self.appViewHeight.constant = CGFloat(self.appViewHeightInt)
                     self.commonAreaViewHeight.constant = CGFloat(self.commonAreaViewHeightInt)
                }else   if value as? String == "DVD、Blu-ray"{
                    self.dvdView.isHidden = false
                    self.commonAreaView.isHidden = false
                    self.dvdViewHeight.constant = CGFloat(self.dvdViewHeightInt)
                     self.commonAreaViewHeight.constant = CGFloat(self.commonAreaViewHeightInt)
                }else   if value as? String == "本、雑誌、漫画"{
                    self.bookView.isHidden = false
                    self.commonAreaView.isHidden = false
                    self.bookViewHeight.constant = CGFloat(self.bookViewHeightInt)
                     self.commonAreaViewHeight.constant = CGFloat(self.commonAreaViewHeightInt)
                }else   if value as? String == "その他"{
                    self.othersView.isHidden = false
                    self.commonAreaView.isHidden = false
                    self.othersViewHeight.constant = CGFloat(self.othersViewHeightInt)
                     self.commonAreaViewHeight.constant = CGFloat(self.commonAreaViewHeightInt)
                }
        },
            cancel: nil,
            origin: sender
        )
    }
    
    
    
    @IBAction func size(_ sender: Any) {
        ActionSheetStringPicker.show(
            withTitle: "サイズの選択",
            rows: ["選択して下さい", "XSサイズ", "Sサイズ", "Mサイズ", "Lサイズ", "LLサイズ", "XLサイズ", "3Lサイズ", "XXLサイズ", "自分で入力する"],
            initialSelection: 0,
            doneBlock: {_, index, value  in
                self.sizeButton.setTitle(value! as? String, for: .normal)
        },
            cancel: nil,
            origin: sender
        )
    }
    
    @IBAction func color(_ sender: Any) {
        ActionSheetStringPicker.show(
            withTitle: "カラーの選択",
            rows: ["選択して下さい", "レッド", "ブルー", "グリーン", "イエロー", "ホワイト", "ブラック", "ゴールド", "シルバー", "自分で入力する"],
            initialSelection: 0,
            doneBlock: {_, index, value  in
                switch sender as! UIButton {
                case self.colorButton:
                    self.colorButton.setTitle(value! as? String, for: .normal)
                case self.spColorButton:
                    self.spColorButton.setTitle(value! as? String, for: .normal)
                case self.pcColorButton:
                    self.pcColorButton.setTitle(value! as? String, for: .normal)
                case self.appColorButton:
                    self.appColorButton.setTitle(value! as? String, for: .normal)
                case self.othersColorButton:
                    self.othersColorButton.setTitle(value! as? String, for: .normal)
                default:
                    return
                }
        },
            cancel: nil,
            origin: sender
        )
    }
    
    @IBAction func condition(_ sender: Any) {
        ActionSheetStringPicker.show(
            withTitle: "商品状態の選択",
            rows: ["S 新品、試用、試着のみ", "A 新古品", "B 使用感が少ない状態の良い中古品", "C 使用感が多少あるものの目立った汚れ、傷がない中古品", "D 使用感があり目立った汚れや傷のある中古品", "自分で入力する"],
            initialSelection: 0,
            doneBlock: {_, index, value  in
                switch sender as! UIButton {
                case self.conditionButton:
                    self.conditionButton.setTitle(value! as? String, for: .normal)
                case self.spConditionButton:
                    self.spConditionButton.setTitle(value! as? String, for: .normal)
                case self.pcConditionButton:
                    self.pcConditionButton.setTitle(value! as? String, for: .normal)
                case self.appConditionButton:
                    self.appConditionButton.setTitle(value! as? String, for: .normal)
                case self.dvdConditionButton:
                    self.dvdConditionButton.setTitle(value! as? String, for: .normal)
                case self.bookConditionButton:
                    self.bookConditionButton.setTitle(value! as? String, for: .normal)
                case self.othersConditionButton:
                    self.othersConditionButton.setTitle(value! as? String, for: .normal)
                default:
                    return
                }
        },
            cancel: nil,
            origin: sender
        )
    }
    
    @IBAction func shipment(_ sender: Any) {
        ActionSheetStringPicker.show(
            withTitle: "発送方法の選択",
            rows: ["クロネコヤマト", "佐川急便", "ゆうパック", "メルカリ",  "自分で入力する"],
            initialSelection: 0,
            doneBlock: {_, index, value  in
                self.commonAreaShip.setTitle(value! as? String, for: .normal)
        },
            cancel: nil,
            origin: sender
        )
    }
    
    
    
    // PickerView End-------------------------------------
   
    
    @IBAction func Insert(_ sender: Any) {
        switch self.genre.currentTitle {
        case "ファッション"?:
            fashion()
        case "スマホ、タブレット"?:
            smartPhone()
            case "PC"?:
            pc()
            case "家電"?:
            app()
            case "DVD、Blu-ray"?:
            dvd()
            case "本、雑誌、漫画"?:
            book()
            case "その他"?:
            others()
        default:
            return
        }
     
        common()

    }
    
    
    // insert functions
    
    // ファッション----------------------------------------
    func fashion () {
        self.textBox.text = "【商品詳細】\n"
        
        if let text = self.product.text, !text.isEmpty {
            self.textBox.text.append("商品名：\(text)\n")
        }
        
        if let text = self.brand.text, !text.isEmpty {
            self.textBox.text.append("ブランド：\(text)\n")
        }
        
        
        if let button = self.sizeButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("サイズ：\n")
            }else{
                self.textBox.text.append("サイズ：\(button)\n")
            }
        }
        
        if let text = self.kitake.text, !text.isEmpty {
            self.textBox.text.append("着丈：\(text)cm\n")
        }
        
        if let text = self.katahaba.text, !text.isEmpty {
            self.textBox.text.append("肩幅：\(text)cm\n")
        }
        
        if let text = self.mihaba.text, !text.isEmpty {
            self.textBox.text.append("身幅：\(text)cm\n")
        }
        
        if let text = self.sodetake.text, !text.isEmpty {
            self.textBox.text.append("袖丈：\(text)cm\n")
        }
        
        
        if let button = self.colorButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("カラー：\n")
            }else{
                self.textBox.text.append("カラー：\(button)\n")
            }
        }
        
        if let button = self.conditionButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("商品状態：\n")
            }else{
                self.textBox.text.append("商品状態：\(button)\n")
            }
        }
        
        
        if let text = self.price.text, !text.isEmpty {
            self.textBox.text.append("定価：\(text)円\n")
        }
        
        if let text = self.explain.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
        
    }
    
    // スマホ
    func smartPhone(){
        if let text = self.spMaker.text, !text.isEmpty {
            self.textBox.text.append("メーカー：\(text)\n")
        }
        
        if let text = self.spModel.text, !text.isEmpty {
            self.textBox.text.append("機種：\(text)\n")
        }
        
        if let button = self.spColorButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("カラー：\n")
            }else{
                self.textBox.text.append("カラー：\(button)\n")
            }
        }
        
        
        if let text = self.spSerialNum.text, !text.isEmpty {
            self.textBox.text.append("製造番号：\(text)\n")
        }
        
        let isChecked: [Bool] = [self.chargerCheck.isChecked, self.earbudCheck.isChecked, self.caseCheck.isChecked, self.manualCheck.isChecked]
        let accCheck: [String] = ["充電器","イヤホン","箱(ケース)","取扱説明書"]
        
        if self.chargerCheck.isChecked || self.earbudCheck.isChecked || self.caseCheck.isChecked || self.manualCheck.isChecked {
            self.textBox.text.append("付属品：")
                for (index, value) in isChecked.enumerated(){
                    if value{
                        self.textBox.text.append("\(accCheck[index])\n")
                    }
                }
        }
        
        
        if let button = self.spConditionButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("商品状態：\n")
            }else{
                self.textBox.text.append("商品状態：\(button)\n")
            }
        }
        
        if let text = self.spExplain.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
    }
    

    // PC
    func pc(){
        if let text = self.pcMaker.text, !text.isEmpty {
            self.textBox.text.append("メーカー：\(text)\n")
        }
        
        if let text = self.pcModel.text, !text.isEmpty {
            self.textBox.text.append("モデル：\(text)\n")
        }
        if let text = self.pcOS.text, !text.isEmpty {
            self.textBox.text.append("OS：\(text)\n")
        }
        
        if let button = self.pcColorButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("カラー：\n")
            }else{
                self.textBox.text.append("カラー：\(button)\n")
            }
        }
        
        if let text = self.pcCPU.text, !text.isEmpty {
            self.textBox.text.append("CPU：\(text)\n")
        }
        
        if let text = self.pcMemory.text, !text.isEmpty {
            self.textBox.text.append("メモリ：\(text)\n")
        }
        
        if let text = self.pcHDD.text, !text.isEmpty {
            self.textBox.text.append("HDD：\(text)\n")
        }
        
        if let text = self.pcMonitor.text, !text.isEmpty {
            self.textBox.text.append("モニター：\(text)\n")
        }
        
        if let button = self.pcConditionButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("商品状態：\n")
            }else{
                self.textBox.text.append("商品状態：\(button)\n")
            }
        }
        
        if let text = self.pcExplain.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
        
    }
    // 家電
    func app(){
        if let text = self.appMaker.text, !text.isEmpty {
            self.textBox.text.append("メーカー：\(text)\n")
        }
        
        if let text = self.appSerialNum.text, !text.isEmpty {
            self.textBox.text.append("型番：\(text)\n")
        }
        
        if let text = self.appYear.text, !text.isEmpty {
            self.textBox.text.append("製造年月：\(text)年")
        }
        
        if let text = self.appMonth.text, !text.isEmpty {
            self.textBox.text.append("\(text)月\n")
        }
        
        if let button = self.appColorButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("カラー：\n")
            }else{
                self.textBox.text.append("カラー：\(button)\n")
            }
        }
       
        if let text = self.appAcc.text, !text.isEmpty {
            self.textBox.text.append("付属品：\(text)\n")
        }
        
        if let button = self.appConditionButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("商品状態：\n")
            }else{
                self.textBox.text.append("商品状態：\(button)\n")
            }
        }
        
        if let text = self.appExplain.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
    }
    // DVD
    func dvd(){
        if let text = self.dvdTitle.text, !text.isEmpty {
            self.textBox.text.append("タイトル：\(text)\n")
        }
        
        if let button = self.dvdConditionButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("商品状態：\n")
            }else{
                self.textBox.text.append("商品状態：\(button)\n")
            }
        }
        
        
        if let text = self.dvdExplain.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
    }
    // 本
    func book(){
        if let text = self.bookTitle.text, !text.isEmpty {
            self.textBox.text.append("タイトル：\(text)\n")
        }
        
        if let text = self.bookAuthor.text, !text.isEmpty {
            self.textBox.text.append("作者：\(text)\n")
        }
        
        if let text = self.bookFirstVol.text, !text.isEmpty {
            self.textBox.text.append("巻数：\(text)卷")
        }
        
        if let text = self.bookSecVol.text, !text.isEmpty {
            self.textBox.text.append("〜\(text)卷\n")
        }
        
        if let button = self.bookConditionButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("商品状態：\n")
            }else{
                self.textBox.text.append("商品状態：\(button)\n")
            }
        }
        
        if let text = self.bookExplain.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
        
    }
    
    // その他
    func others(){
        if let text = self.othersProduct.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
        
        if let button = self.othersColorButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("カラー：\n")
            }else{
                self.textBox.text.append("カラー：\(button)\n")
            }
        }
        
        if let button = self.othersConditionButton.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("商品状態：\n")
            }else{
                self.textBox.text.append("商品状態：\(button)\n")
            }
        }
        
        
        if let text = self.othersExplain.text, !text.isEmpty {
            self.textBox.text.append("商品説明：\(text)\n")
        }
        
    }
   
    
    // 共通部分----------------------------------------
    func common(){
        self.textBox.text.append("\n【発送】\n")
        
        if let button = self.commonAreaShip.currentTitle{
            if (button == "選択して下さい"){
                //何もしない
            }else if (button == "自分で入力する"){
                self.textBox.text.append("発送方法：\n")
            }else{
                self.textBox.text.append("発送方法：\(button)\n")
            }
        }
        
        if let text = self.commonAreaShipPrice.text, !text.isEmpty {
            self.textBox.text.append("発送料金：\(text)\n")
        }
        
          self.textBox.text.append("\n【その他】\n")
        
        let isChecked: [Bool] = [self.ufjCheck.isChecked, self.smbcCheck.isChecked, self.yuuchoCheck.isChecked, self.japanNetlCheck.isChecked, self.yahooCheck.isChecked]
        
        let payCheck: [String] = ["三菱東京UFJ銀行","三井住友銀行","ゆうちょ銀行","ジャパンネット銀行","Yahoo決済"]
        
        
        if self.ufjCheck.isChecked || self.smbcCheck.isChecked || self.yuuchoCheck.isChecked || self.japanNetlCheck.isChecked || self.yahooCheck.isChecked || self.byMyselfCheck.isChecked{
            self.textBox.text.append("支払い方法：")
            
            if !self.byMyselfCheck.isChecked{
                for (index, value) in isChecked.enumerated(){
                    if value{
                        self.textBox.text.append("\(payCheck[index])\n")
                    }
                }
            }
        }
    
    }

    
    @IBAction func saveTemp(_ sender: Any) {
        guard let title = tempTitle else {
            return
        }
        
        if (title.text?.isEmpty)!{
             toast(message: "タイトルを入力して下さい。")
        }else{
            TemplateTableViewController.template.append(self.tempTitle.text!)
            TemplateTableViewController.tempContent.append(self.textBox.text)
             toast(message: "テンプレートとして保存しました。")
        }
        
    }
    
    
    //クリップボードにコピー
    @IBAction func copyClipboard(_ sender: Any) {
        let pasteboard: UIPasteboard = UIPasteboard.general
        pasteboard.string = textBox.text
        toast(message: "コピーしました")
    }
    
    
    //改行ボタンが押された際に呼ばれる.
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//
//        return true
//    }
    
    //Viewをタップした時に起こる処理を描く関数
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchOrScrol = true
    }
    
    override  func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesMoved(touches, with: event)
       self.touchOrScrol = false
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
        if self.touchOrScrol == true{
            view.endEditing(true)
        }
        print("touchesEnded")
    }
    
    
    //UIKeyboardWillShow通知を受けて、実行される関数
    @objc func keyboardWillShow(_ notification: NSNotification){
        
       let keyboardHeight = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.height
        
        self.commonAreaViewHeight.constant = CGFloat(370 + Int(keyboardHeight))
        
        
         self.admobView.frame.origin = CGPoint(x:0, y:self.view.frame.size.height - admobView.frame.height - keyboardHeight)
 
        
    }
    
    
    //UIKeyboardWillHide通知を受けて、実行される関数
    @objc func keyboardWillHide(_ notification: NSNotification){
        self.commonAreaViewHeight.constant = 370
       
 self.admobView.frame.origin = CGPoint(x:0, y:self.view.frame.size.height - admobView.frame.height)
        
        
    }
    
  
    
    
   /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else{
            return
        }
        let pickupVC = segue.destination as! PickerViewController
        switch identifier {
        case "pickGenre":
            pickupVC.segueNum = 0
        case "sizeInsert":
            pickupVC.segueNum = 1
        default:
            return
        }
        
    }
    */

}

extension UIViewController {
    func toast(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: {
            // アラートを閉じる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                alert.dismiss(animated: true, completion: nil)
            })
        })
    }
}

extension UIScrollView {
    
   
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
        print("touchesBegan")
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesMoved(touches, with: event)
        print("touchesMoved")
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
        print("touchesEnded")
    }
}


