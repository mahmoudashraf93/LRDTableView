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
    fileprivate let stackView = UIStackView()
    let placeholderImageView = UIImageView()
    let actionButton = UIButton()
    fileprivate var topConstraint = NSLayoutConstraint()
    private var isFirstReload : Bool = true
    public var shouldListenToFirstReload : Bool = false
    var topDistance : CGFloat?{
        didSet{
            self.topConstraint.constant = topDistance!
            self.layoutIfNeeded()
            
        }
    }
    var text : String?{
        didSet{
            noResultsLabel.text = self.text!
        }
    }
    @IBInspectable var image:UIImage? {
        
        didSet {
            self.placeholderImageView.image = image
            self.placeholderImageView.isHidden = false
            
        }
    }
    @IBInspectable var hasActionButton:Bool = false {
        
        didSet {
            if hasActionButton {
                self.actionButton.isHidden = false
                
            }
            
        }
    }
    @IBInspectable var actionTitle:String? {
        
        didSet {
            self.actionButton.setTitle(actionTitle, for: .normal)
        }
    }
    
    @IBInspectable var actionBackgroundColour:UIColor? {
        
        didSet {
            self.actionButton.backgroundColor = actionBackgroundColour
            
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
        self.noResultsLabel.isHidden = true
        super.reloadData()
        
        if self.isFirstReload && self.shouldListenToFirstReload{
            self.shouldListenToFirstReload = true
            self.isFirstReload = false
            if self.numberOfRows(inSection: 0) == 0 {
                self.showSubViews()
            }
            else {
                self.hideSubViews()
            }
            return
        }
        
        if self.numberOfRows(inSection: 0) == 0 && !self.isFirstReload {
            
            self.showSubViews()
        }
        else {
            
            self.hideSubViews()
            
        }
        self.isFirstReload = false
        
    }
    
    fileprivate func commonInit() {
        
        self.setupSubViews()
        
        
        
    }
    
    fileprivate func showSubViews(){
        self.noResultsLabel.isHidden = false
        self.placeholderImageView.isHidden = false
        self.actionButton.isHidden = false
        self.separatorStyle = .none
        
    }
    fileprivate func hideSubViews(){
        self.noResultsLabel.isHidden = true
        self.placeholderImageView.isHidden = true
        self.actionButton.isHidden = true
        self.separatorStyle = .singleLine
        
    }
    fileprivate func setupSubViews(){
        // stackview
        self.stackView.axis = .vertical
        self.stackView.distribution = .equalSpacing
        self.stackView.alignment = .center
        self.stackView.spacing = 100
        
        self.stackView.addArrangedSubview(self.noResultsLabel)
        self.noResultsLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
        self.noResultsLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor).isActive = true
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        //Layout for Stack View
        self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.topConstraint = NSLayoutConstraint(item: self.stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: self.topDistance ?? 10.0)
        self.addConstraint(topConstraint)
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        self.noResultsLabel.text = text ?? "OOPS Nothing To Show Yet!"
        self.noResultsLabel.textColor = UIColor.black
        self.noResultsLabel.numberOfLines = 0
        self.noResultsLabel.sizeToFit()
        self.noResultsLabel.isHidden = true
        self.noResultsLabel.textAlignment = .center
        self.noResultsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.placeholderImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.placeholderImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.placeholderImageView.isHidden = true
        self.placeholderImageView.contentMode = .scaleAspectFit
        self.stackView.addArrangedSubview(self.placeholderImageView)
        
        self.actionButton.isHidden = true
        self.actionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.stackView.addArrangedSubview(self.actionButton)
        
        
        
        
        
        
        
    }
}

