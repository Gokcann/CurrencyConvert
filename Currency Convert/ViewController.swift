//
//  ViewController.swift
//  Currency Convert
//
//  Created by Gökcan Akoya on 20.04.2019.
//  Copyright © 2019 Gökcan Akoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRates(_ sender: Any) {
        //http url kullandigimiz icin info.plist icinde apptransportsecuritysetting kismini degistirmek gerekiyor ->allow arbitrary loads : yes
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=eb2d284a97cb595cbd107ae17a4bf8b3&format=1")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                if data != nil {
                    
                    
                    do{
                        //value degisken oldugundan stringe anyobject olarak aliyoruz
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
                        
                        DispatchQueue.main.async {
                            print(jsonResult)
                            //cadLabel.text = jsonResult.values[1]
                        }
                    } catch {
                        print("error json")
                        
                        
                    }
                }
            }
            
        }
        task.resume()
        
    }
    
    
}

