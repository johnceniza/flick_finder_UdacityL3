//
//  ViewController.swift
//  flick_finder_JC
//
//  Created by John Ceniza on 8/11/15.
//  Copyright (c) 2015 AppDeco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var phraseField: UITextField!
    @IBOutlet weak var longField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var imageTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func phraseSearchPressed(sender: UIButton) {
        let session = NSURLSession.sharedSession()
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=e5c4053a417e38d09213c3b4d654e4ae&text=baby+asian+elephant&extras=url_m&format=json&nojsoncallback=1"
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            if let error = downloadError {
                println("Could not complete the request \(error)")
            } else {
                /* 5 - Success! Parse the data */
                var parsingError: NSError? = nil
                let parsedResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parsingError)
                
                if let photosDictionary = parsedResult.valueForKey("photos") as? NSDictionary {
                    if let photoArray = photosDictionary.valueForKey("photo") as? [[String: AnyObject]] {
                        
                        println("\(photoArray)")

                        /* 6 - Grab a single, random image */
                        let randomPhotoIndex = Int(arc4random_uniform(UInt32(photoArray.count)))
                        let photoDictionary = photoArray[randomPhotoIndex] as [String: AnyObject]
                        
                        /* 7 - Get the image url and title */
                        let photoTitle = photoDictionary["title"] as? String
                        let imageUrlString = photoDictionary["url_m"] as? String
                        let imageURL = NSURL(string: imageUrlString!)
                        
                        /* 8 - If an image exists at the url, set the image and title */
                        if let imageData = NSData(contentsOfURL: imageURL!) {
                            dispatch_async(dispatch_get_main_queue(), {
                                self.theImage.image = UIImage(data: imageData)
                                self.imageTitle.text = photoTitle
                            })
                        } else {
                            println("Image does not exist at \(imageURL)")
                        }
                    } else {
                        println("Cant find key 'photo' in \(photosDictionary)")
                    }
                } else {
                    println("Cant find key 'photos' in \(parsedResult)")
                }
            }
            
        }
        
        task.resume()
    }
    
    @IBAction func latLongSearchPressed(sender: UIButton) {
        
    }

}

