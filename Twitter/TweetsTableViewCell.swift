//
//  TweetsTableViewCell.swift
//  Twitter
//
//  Created by Archit Rathi on 2/7/16.
//  Copyright © 2016 Archit Rathi. All rights reserved.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var rtCountLabel: UILabel!
    @IBOutlet weak var favCountLabel: UILabel!
    
    @IBOutlet weak var rtButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var isRetweet = false
    var isFav = false
    
    
    var tweet: Tweet! {
        didSet {
            if (tweet.text != nil) {
                tweetLabel.text = tweet.text
            }
            if (tweet.user?.name != nil) {
                usernameLabel.text = tweet.user!.name
            }
            if (tweet.user?.profileImageUrl != nil) {
                profileImage.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!)!)
            }
            if (tweet.createdAtString != nil) {
                timestampLabel.text = "\(tweet.createdAtString!)"
            }
            if (tweet.user?.screenname != nil) {
                handleLabel.text = "@\(tweet.user!.screenname!)"
            }
            
            if (tweet.isFavorited != nil) {
                if (tweet.isFavorited!) {
                    favButton.tintColor = UIColor.blueColor()
                    favCountLabel.textColor = UIColor.blueColor()
                }
                else {
                    favButton.tintColor = UIColor.blueColor()
                    favCountLabel.textColor = UIColor.blueColor()
                }
            }
            if (tweet.isRetweeted != nil) {
                if (tweet.isRetweeted!) {
                    rtButton.tintColor = UIColor.blueColor()
                    rtCountLabel.textColor = UIColor.blueColor()
                }
                else {
                    rtButton.tintColor = UIColor.blueColor()
                    rtCountLabel.textColor = UIColor.blueColor()
                }
            }
            if (tweet.retweetCount != nil) {
                rtCountLabel.text = "\(tweet.retweetCount!)"
            }
            if (tweet.user?.favoriteCount != nil) {
                favCountLabel.text = "\(tweet.user!.favoriteCount!)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func retweetButtonTouched(sender: AnyObject) {
        isRetweet = !isRetweet
        
        if (isRetweet) {
            rtButton.tintColor = UIColor.blueColor()
            rtCountLabel.textColor = UIColor.blueColor()
            if (tweet.retweetCount != nil) {
                tweet.retweetCount = tweet.retweetCount! + 1
            }
            TwitterClient.sharedInstance.retweetMe(tweet.id!)
        }
        else {
            rtButton.tintColor = UIColor.blueColor()
            rtCountLabel.textColor = UIColor.blueColor()
            if (tweet.retweetCount != nil) {
                tweet.retweetCount = tweet.retweetCount! - 1
            }
            TwitterClient.sharedInstance.unRetweetMe(tweet.id!)
        }
    }
    
    @IBAction func favoriteButtonTouched(sender: AnyObject) {
        isFav = !isFav
        
        if (isFav) {
            favButton.tintColor = UIColor.blueColor()
            favCountLabel.textColor = UIColor.blueColor()
            if (tweet.user?.favoriteCount != nil) {
                tweet.user?.favoriteCount = tweet.user!.favoriteCount! + 1
            }
            TwitterClient.sharedInstance.favoriteMe(tweet.id!)
        }
        else {
            favButton.tintColor = UIColor.blueColor()
            favCountLabel.textColor = UIColor.blueColor()
            if (tweet.user?.favoriteCount != nil) {
                tweet.user?.favoriteCount = tweet.user!.favoriteCount! - 1
            }
            TwitterClient.sharedInstance.unFavoriteMe(tweet.id!)
        }
    }
}
