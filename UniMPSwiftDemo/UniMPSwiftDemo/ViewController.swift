//
//  ViewController.swift
//  UniMPSwiftDemo
//
//  Created by dcloud on 2024/1/19.
//

import UIKit
#warning ("swift 工程仅作为运行参考，更多示例请参考 OC 工程")
class ViewController: UIViewController,DCUniMPSDKEngineDelegate {

    let APPID1 = "__UNI__11E9B73"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DCUniMPSDKEngine.setDelegate(self)
        checkUniMPResoutce(appid: APPID1)
    }
    
    func checkUniMPResoutce(appid: String) -> Void {
        let wgtPath = Bundle.main.path(forResource: appid, ofType: "wgt") ?? ""
#warning ("注意：isExistsUniMP: 方法判断的仅是运行路径中是否有对应的应用资源，宿主还需要做好内置wgt版本的管理，如果更新了内置的wgt也应该执行 releaseAppResourceToRunPathWithAppid 方法应用最新的资源")
        if DCUniMPSDKEngine.isExistsUniMP(appid) {
            let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
            let name = version["code"]!
            let code = version["code"]!
            print("小程序：\(appid) 资源已存在，版本信息：name:\(name) code:\(code)")
        } else {
            do {
                try DCUniMPSDKEngine.installUniMPResource(withAppid: appid, resourceFilePath: wgtPath, password: nil)
                let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
                let name = version["code"]!
                let code = version["code"]!
                print("✅ 小程序：\(appid) 资源释放成功，版本信息：name:\(name) code:\(code)")
            } catch let err as NSError {
                print("❌ 小程序：\(appid) 资源释放失败:\(err)")
            }
        }
    }
    
    
    /// 打开uni小程序
    @IBAction func openUniMP() {
        
        let configuration = DCUniMPConfiguration.init()
        configuration.enableBackground = true
        
        DCUniMPSDKEngine.openUniMP(APPID1, configuration: configuration) { instance, error in
            if instance != nil {
                print("小程序打开成功")
            } else {
                print(error as Any)
            }
        }
    }
    
    
    // MARK: - DCUniMPSDKEngineDelegate
    func uniMP(onClose appid: String) {
        print("小程序：\(appid) closed")
    }
    
    func defaultMenuItemClicked(_ appid: String, identifier: String) {
        print("defaultMenuItemClicked：\(appid) \(identifier)")
    }
    
    func splashView(forApp appid: String) -> UIView {
        let splashView:UIView = Bundle.main.loadNibNamed("SplashView", owner: self, options: nil)?.last as! UIView
        return splashView
    }

}

