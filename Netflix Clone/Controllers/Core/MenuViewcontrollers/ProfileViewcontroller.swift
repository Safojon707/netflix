//
//  ProfileViewcontroller.swift
//  Netflix Clone
//
//  Created by Safojon Axmadov on 13/09/23.
//


import UIKit
import SnapKit
import SideMenu

class ProfileViewcontroller: UIViewController {
    let tableView = UITableView()
    let viewImage = UIImageView()
    var menuArr = [  "Home", "Search", "Share", "About", "Rate", "Quit"]
    
//    var soupsArray = [Soup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        SearchViewController()
        view.backgroundColor = .black
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 35)!]
       
        view.addSubview(viewImage)
        viewImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        title = "𝐌𝐚𝐢𝐧 𝐌𝐞𝐧𝐮"
        view.roundCorners(corners: [ .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 16)
      
        tableView.backgroundColor = .black
        
        tableView.separatorStyle = .none
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
        
    }
    func homeDismiss(){
        dismiss(animated: true)
    }
    
   
    func searchClicked() {
        tabBarController?.selectedIndex = 0
    }
    
   
    func shareClicked(){
        let vc = UIActivityViewController(activityItems: ["https://apps.apple.com"], applicationActivities: nil)
        vc.popoverPresentationController?.sourceView = self.view
        self.present(vc, animated: true, completion: nil)
    }
    
    func abountClicked() {
        let vc = AboutViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("not abount")
    }
    
    func rateApp()->Void{
        let url = URL(string: "https://apps.apple.com/app/apple-store")!
        UIApplication.shared.open(url)
    }
    
    func quitClicked(){
        let alert = UIAlertController(title: "Quit", message: "Do you want to quit the app?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "not", style: .cancel) { _ in
            self.dismiss(animated: true)
        })
        alert.addAction(UIAlertAction(title: "ok", style: .destructive){ _ in
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                exit(EXIT_SUCCESS)
            }
        })
        
        self.present(alert,animated: true)
     
    }
    
}
extension ProfileViewcontroller: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.initData(menuArr[indexPath.row],icon:  menuArr[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        tableView.deselectRow(at: indexPath, animated: true)
      
        if indexPath.row == 0 {
            homeDismiss()
        }
        if indexPath.row == 1 {
//          let vc = SearchViewController()
//            vc.allSoupsArr = soupsArray
//            navigationController?.pushViewController(vc , animated: true)
            
            dismiss(animated: true) {
                self.tabBarController?.selectedIndex = 2
            }
            tabBarController?.selectedIndex = 2
        }
        
        if indexPath.row == 2 {
            shareClicked()
        }
        if indexPath.row == 3 {
            abountClicked()
        }
        if indexPath.row == 4{
            rateApp()
        }
        if indexPath.row == 5 {
            quitClicked()
        }
    }
  
}

extension UIView {

   func roundCorners(corners:CACornerMask, radius: CGFloat) {
      self.layer.cornerRadius = radius
      self.layer.maskedCorners = corners
       
   }
}

extension UIImage {

func tintedWithLinearGradientColors(colorsArr: [CGColor]) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
    guard let context = UIGraphicsGetCurrentContext() else {
        return UIImage()
    }
    context.translateBy(x: 0, y: self.size.height)
    context.scaleBy(x: 1, y: -1)
    context.setBlendMode(.normal)
    let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
    // Create gradient
    let colors = colorsArr as CFArray
    let space = CGColorSpaceCreateDeviceRGB()
    let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)
    // Apply gradient
    context.clip(to: rect, mask: self.cgImage!)
    context.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: self.size.height), options: .drawsAfterEndLocation)
    let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return gradientImage!
}
    
   
    
}
