//
//  ComposeTweetViewController.swift
//  Twitter
//
//  Created by Archit Rathi on 2/14/16.
//  Copyright © 2016 Archit Rathi. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetText: UITextField!
    @IBOutlet weak var characterLimitLabel: UILabel!
    @IBOutlet weak var sendButton1: UIButton!
    
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TwitterClient.sharedInstance.myCredentials() { (user, error) -> () in
            self.user = user
            
        if (user.name != nil) {
           self.usernameLabel.text = user.name
        }

        if (user.profileImageUrl != nil) {
            self.profileImage.setImageWithURL(NSURL(string: user.profileImageUrl!)!)
        }
        
        // Do any additional setup after loading the view.
        }

        
    }
    
    
    @IBAction func textChanged(sender: AnyObject) {
        print("changed")
        let temp = tweetText.text
        let numTemp = temp?.characters.count
        characterLimitLabel.text = "\(140 - numTemp!)"
        if (Int(characterLimitLabel.text!)! <= 0) {
            tweetText.text = String(tweetText.text!.characters.dropLast())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func sendButton(sender: AnyObject) {
        if (tweetText.text != nil) {
            let messageToSend = tweetText.text!.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            TwitterClient.sharedInstance.makeTweet(messageToSend)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
