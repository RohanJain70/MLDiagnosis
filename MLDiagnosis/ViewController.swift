//
//  ViewController.swift
//  MLDiagnosis
//
//  Created by Rohan Jain on 11/04/20.
//  Copyright © 2020 Rohan Jain. All rights reserved.
//

import Cocoa
import Quartz

class ViewController: NSViewController {

    @IBOutlet weak var holderImageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func onClickUpload(_ sender: Any) {
        print("Open the finder to upload the images")
        let pictureTaker = IKPictureTaker()
        pictureTaker.setValue(true, forKey: IKPictureTakerAllowsFileChoosingKey)
        pictureTaker.beginSheet(for: self.view.window, withDelegate: self, didEnd: #selector(pictureTakerDidEnd), contextInfo: nil)
    }
    
    @objc func pictureTakerDidEnd(picker: IKPictureTaker, returnCode: NSInteger, contextInfo: UnsafeRawPointer) {
        let image = picker.outputImage()
        
        if image != nil && returnCode == NSApplication.ModalResponse.OK.rawValue {
            holderImageView.image = image
        }
    }
}

