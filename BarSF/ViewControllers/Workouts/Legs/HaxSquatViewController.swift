//
//  HaxSquatViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/3/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit
import AVKit

class HaxSquatMachineViewController: UIViewController {

    @IBOutlet weak var playv: UIButton!
    
  
    let avPlayerViewController = AVPlayerViewController()
    var avPlayer:AVPlayer?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
      
        let movieUrl:NSURL? = NSURL(string: "https://firebasestorage.googleapis.com/v0/b/messenger-test-d225b.appspot.com/o/test%2FTestVideo.mov?alt=media&token=bd4ccba3-b446-43bc-809e-b1152aa3c2ff")
        if let url = movieUrl {
        self.avPlayer = AVPlayer(url: url as URL)
        self.avPlayerViewController.player = self.avPlayer
        }
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayerViewController.player?.currentItem)
        
        
        self.present(self.avPlayerViewController, animated: true) { () -> Void in
                self.avPlayerViewController.player?.play()        // Do any additional setup after loading the view.
        }
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
            self.avPlayerViewController.dismiss(animated: true)
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func playV(sender: UIButton) {
       
            

         
              
                let amovieUrl:NSURL? = NSURL(string: "https://firebasestorage.googleapis.com/v0/b/messenger-test-d225b.appspot.com/o/test%2FTestVideo.mov?alt=media&token=bd4ccba3-b446-43bc-809e-b1152aa3c2ff")
                if let aurl = amovieUrl {
                    self.avPlayer = AVPlayer(url: aurl as URL)
                self.avPlayerViewController.player = self.avPlayer
            
    self.present(self.avPlayerViewController, animated: true) { () -> Void in
            self.avPlayerViewController.player?.play()

       
    }

    }
}
        
     
        
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
