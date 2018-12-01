//
//  AddTemplateViewController.swift
//  auctionFormat
//
//  Created by akira on 2018-03-28.
//  Copyright © 2018 akira. All rights reserved.
//

import UIKit

class AddTemplateViewController: UIViewController {
    
    var template: String?
    var templateTitle:String?
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var templateText: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let template = self.templateTitle, let tempContent = self.template{
            self.titleText.text = template
            self.templateText.text = tempContent
        }else{
           self.template = ""
            self.templateTitle = ""
        }
        
        self.titleText.placeholder = "タイトルを入力して下さい。"
        
        if self.templateTitle!.isEmpty{
            self.saveButton.isEnabled = false
        }
        
    }
    
    
    
    @IBAction func titleChanged(_ sender: Any) {
        let tempTitle = self.titleText.text ?? ""
        self.saveButton.isEnabled = !tempTitle.isEmpty
    }
    
    
    @IBAction func cancelMethod(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //クリップボードにコピー
    @IBAction func copyClipboard(_ sender: Any) {
        let pasteboard: UIPasteboard = UIPasteboard.general
        pasteboard.string = templateText.text
        toast(message: "コピーしました")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else{
            return
        }
        self.templateTitle = self.titleText.text ?? ""
        self.template = self.templateText.text ?? ""
    }
    

}
