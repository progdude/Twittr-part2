//
//  TweetDetailViewController.swift
//  Twitter
//
//  Created by Archit Rathi on 2/14/16.
//  Copyright © 2016 Archit Rathi. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var rtCountLabel: UILabel!
    @IBOutlet weak var favCountLabel: UILabel!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetLabel.text = tweet.text
        usernameLabel.text = tweet.user!.name
        profileImage.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!)!)
        timestampLabel.text = "\(tweet.createdAtString!)"
        handleLabel.text = "@\(tweet.user!.screenname!)"
        favCountLabel.text = "\(tweet.user!.favoriteCount!)"
        rtCountLabel.text = "\(tweet.retweetCount!)"
        
        
        print(tweet)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigatio
    

}
