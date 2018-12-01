//
//  ViewController.swift
//  auctionFormat
//
//  Created by akira on 2018-02-27.
//  Copyright © 2018 akira. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    // AdMob
    //static let AdMobID = "[Your AdMob ID]"
   static let AdMobID = "ca-app-pub-3940256099942544/2934735716"

    static let TEST_ID = "ca-app-pub-3940256099942544/2934735716"
   static let AdMobTest:Bool = false
    
    
    // button action
    @IBAction func createButton(_ sender: Any) {
    }
    
    @IBAction func keptTemplate(_ sender: Any) {
    }
    
    @IBAction func usage(_ sender: Any) {
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
        
    @IBAction func backToTop(segue: UIStoryboardSegue) {}
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var keptTemplate: UIButton!
    @IBOutlet weak var usage: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createButton.backgroundColor = UIColor.lightGray
        keptTemplate.backgroundColor = UIColor.lightGray
        usage.backgroundColor = UIColor.lightGray
        
        
        
        
        // 以下バナー関連
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")

        var admobView = GADBannerView()

        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        admobView.frame.origin = CGPoint(x:0, y:self.view.frame.size.height - admobView.frame.height)
        admobView.frame.size = CGSize(width:self.view.frame.width, height:admobView.frame.height)

        if ViewController.AdMobTest {
            admobView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        }
        else{
            admobView.adUnitID = ViewController.AdMobID
        }

        admobView.rootViewController = self
        admobView.load(GADRequest())

        self.view.addSubview(admobView)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



