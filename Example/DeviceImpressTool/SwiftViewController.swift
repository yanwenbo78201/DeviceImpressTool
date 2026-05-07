//
//  SwiftViewController.swift
//  DeviceImpressTool_Example
//
//  Created by Computer  on 07/05/26.
//  Copyright © 2026 crazyLuobo. All rights reserved.
//

import UIKit
import DeviceImpressTool

class SwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(SystemService().deviceInfo())
        
        ImpressService.compressImage(forUploadKilobyteRange200To600: UIImage(named: "big.JPEG")!) { out, error in
            if error != nil{
                
            }else{
                print("压缩成功\(String(describing: out?.data))")
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
