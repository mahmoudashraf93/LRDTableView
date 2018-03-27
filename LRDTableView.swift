//
//  LRDTableView.swift
//  Buckle Up
//
//
//
//

import UIKit

class LRDTableView: UITableView {
    
    
    let noResultsLabel = UILabel()
    
    var text : String?{
        didSet{
            noResultsLabel.text = self.text!
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    public override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func reloadData() {
        noResultsLabel.isHidden = true
        super.reloadData()
       
        if self.numberOfRows(inSection: 0) == 0 {
            noResultsLabel.isHidden = false
            self.separatorStyle = .none
       
        }
        else {
            
            noResultsLabel.isHidden = true
            self.separatorStyle = .singleLine

        }
    }
    
    fileprivate func commonInit() {
        
        self.setupSubViews()
        
        
        
    }
    
    fileprivate func setupSubViews(){
        noResultsLabel.text = text ?? "Nothing To Show Yet!"
        noResultsLabel.textColor = UIColor.black
        
        noResultsLabel.isHidden = true
        noResultsLabel.textAlignment = .center
        noResultsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(noResultsLabel)
        
        
        
        let horizontalConstraint = NSLayoutConstraint(item: noResultsLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 10)
        let verticalConstraint = NSLayoutConstraint(item: noResultsLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: noResultsLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
        let heightConstraint = NSLayoutConstraint(item: noResultsLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 30)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
    }
}
