//
//  MenuCell.swift
//  Netflix Clone
//
//  Created by Safojon Axmadov on 13/09/23.
//
import UIKit
class MenuCell: UITableViewCell {
  
      
    let image = UIImageView()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
            // view.padding(15, 15, 5, 5)
        view.backgroundColor = .clear
        view.textAlignment = .center
        
        view.layer.cornerRadius  = 16
        view.layer.borderColor = CGColor(gray: 0.8, alpha: 0.9)
        view.layer.borderWidth = 1
        view.font = .systemFont(ofSize: 24, weight: .semibold)
        view.numberOfLines = 1
        view.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner], radius: 24)
        return view
    }()
    

    
    lazy var imageView1: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    let viewImage: UIImageView = {
        let view = UIImageView()
    
        view.image = UIImage(named: "bg4")
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubview(viewImage)
        contentView.addSubview(titleLabel)
//        contentView.addSubview(descLabel)
        contentView.addSubview(imageView1)
       
       
        
        viewImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.height.equalToSuperview()
        }

        imageView1.snp.makeConstraints { make in
          
            make.top.equalTo(6 )
            make.left.equalTo(10)
            make.width.height.equalTo(30)
            make.bottom.equalTo(-5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(6)
            make.left.equalTo(imageView1.snp.right).offset(10)
            make.right.equalTo(-5)
            make.height.equalTo(70)
            make.bottom.equalTo(-5)
        }
        
    }
    
    func initData(_ name: String, icon: String){
        titleLabel.text = name
        imageView1.image = UIImage(named: icon)?.withRenderingMode(.alwaysTemplate).tintedWithLinearGradientColors(colorsArr: [UIColor.white.cgColor,UIColor.purple.cgColor, UIColor.red.cgColor])
       
    }
  
}
