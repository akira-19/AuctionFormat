//
//  EditTemplateViewController.swift
//  auctionFormat
//
//  Created by akira on 2018-04-07.
//  Copyright © 2018 akira. All rights reserved.
//

import UIKit

class EditTemplateViewController: UIViewController {

    var template: String?
    var templateTitle:String?
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var templateText: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var newSaveButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleText.placeholder = "タイトルを入力して下さい"
        
        // Do any additional setup after loading the view.
        if let template = self.templateTitle, let tempContent = self.template{
            self.titleText.text = template
            self.templateText.text = tempContent
        }else{
            self.template = ""
            self.templateTitle = ""
        }
        
        
        if self.templateTitle!.isEmpty{
            self.saveButton.isEnabled = false
        }
        
    }
    
    
    
    @IBAction func titleChanged(_ sender: Any) {
        let tempTitle = self.titleText.text ?? ""
        self.saveButton.isEnabled = !tempTitle.isEmpty
        self.newSaveButton.isEnabled = !tempTitle.isEmpty

    }
    
    
    @IBAction func cancelMethod(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //クリップボードにコピー
    @IBAction func copyClipboard(_ sender: Any) {
        let pasteboard: UIPasteboard = UIPasteboard.general
        pasteboard.string = templateText.text
        toast(message: "コピーしました")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIButton, button === self.saveButton || button === self.newSaveButton else{
            return
        }
        self.templateTitle = self.titleText.text ?? ""
        self.template = self.templateText.text ?? ""
    }

}
