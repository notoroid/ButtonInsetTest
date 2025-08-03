//
//  ViewController.swift
//  ButtonInsetTest
//
//  Created by 能登 要 on 2025/08/02.
//
// https://noahgilmore.com/blog/uibutton-padding
// https://zenn.dev/samekard_dev/articles/c737dee4bcc5f6
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var ios13Button: UIButton!
    var ios15Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ios13Button = UIButton(type: .system)
        ios15Button = UIButton(type: .system)
        
        let buttons: [UIButton] = [ios13Button, ios15Button]
        let colors: [UIColor] = [.yellow, .cyan]
        
        for iterator in buttons.enumerated() {
            let button = iterator.element
            button.setTitle("Button", for: .normal)
            button.setImage(UIImage(named: "Icon"), for: .normal)
            button.backgroundColor = colors[iterator.offset]
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 30).isActive = true
            button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        }
        updateUserInterface( selectedIndex: 0 )
        
    }
    
    @IBOutlet weak var ios13StackView: UIStackView!
    @IBOutlet weak var contentTopSlider: UISlider!
    @IBOutlet weak var contentTopLabel: UILabel!
    @IBOutlet weak var contentBottomSlider: UISlider!
    @IBOutlet weak var contentBottomLabel: UILabel!
    @IBOutlet weak var contentLeftSlider: UISlider!
    @IBOutlet weak var contentLeftLabel: UILabel!
    @IBOutlet weak var contentRightSlider: UISlider!
    @IBOutlet weak var contentRightLabel: UILabel!
    
    @IBOutlet weak var imageTopSlider: UISlider!
    @IBOutlet weak var imageTopLabel: UILabel!
    @IBOutlet weak var imageBottomSlider: UISlider!
    @IBOutlet weak var imageBottomLabel: UILabel!
    @IBOutlet weak var imageLeftSlider: UISlider!
    @IBOutlet weak var imageLeftLabel: UILabel!
    @IBOutlet weak var imageRightSlider: UISlider!
    @IBOutlet weak var imageRightLabel: UILabel!
    
    @IBOutlet weak var titleTopSlider: UISlider!
    @IBOutlet weak var titleTopLabel: UILabel!
    @IBOutlet weak var titleBottomSlider: UISlider!
    @IBOutlet weak var titleBottomLabel: UILabel!
    @IBOutlet weak var titleLeftSlider: UISlider!
    @IBOutlet weak var titleLeftLabel: UILabel!
    @IBOutlet weak var titleRightSlider: UISlider!
    @IBOutlet weak var titleRightLabel: UILabel!
    
    
    @IBOutlet weak var ios15StackView: UIStackView!
    
    @IBOutlet weak var ios15ContentTopSlider: UISlider!
    @IBOutlet weak var ios15ContentTopLabel: UILabel!
    @IBOutlet weak var ios15ContentBottomSlider: UISlider!
    @IBOutlet weak var ios15ContentBottomLabel: UILabel!
    @IBOutlet weak var ios15ContentLeftSlider: UISlider!
    @IBOutlet weak var ios15ContentLeftLabel: UILabel!
    @IBOutlet weak var ios15ContentRightSlider: UISlider!
    @IBOutlet weak var ios15ContentRightLabel: UILabel!
    
    @IBOutlet weak var ios15ImageTopSlider: UISlider!
    @IBOutlet weak var ios15ImageTopLabel: UILabel!
    @IBOutlet weak var ios15ImageBottomSlider: UISlider!
    @IBOutlet weak var ios15ImageBottomLabel: UILabel!
    @IBOutlet weak var ios15ImageLeftSlider: UISlider!
    @IBOutlet weak var ios15ImageLeftLabel: UILabel!
    @IBOutlet weak var ios15ImageRightSlider: UISlider!
    @IBOutlet weak var ios15ImageRightLabel: UILabel!
    
    @IBOutlet weak var ios15TitleTopSlider: UISlider!
    @IBOutlet weak var ios15TitleTopLabel: UILabel!
    @IBOutlet weak var ios15TitleBottomSlider: UISlider!
    @IBOutlet weak var ios15TitleBottomLabel: UILabel!
    @IBOutlet weak var ios15TitleLeftSlider: UISlider!
    @IBOutlet weak var ios15TitleLeftLabel: UILabel!
    @IBOutlet weak var ios15TitleRightSlider: UISlider!
    @IBOutlet weak var ios15TitleRightLabel: UILabel!
    
    
    @IBAction func onChangeSegment(_ segementControl: UISegmentedControl) {
        updateUserInterface(selectedIndex: segementControl.selectedSegmentIndex)
    }
    
    func updateUserInterface( selectedIndex: Int ){
        switch selectedIndex {
        case 0:
            ios13Button.isHidden = false
            ios13StackView.isHidden = false
            
            ios15StackView.isHidden = true
            ios15Button.isHidden = true
        case 1:
            ios13Button.isHidden = true
            ios13StackView.isHidden = true
            
            ios15StackView.isHidden = false
            ios15Button.isHidden = false
        default:
            break
        }
    }
    
    func updateSlider(
        keyPathPairsForUpdate:[(KeyPath<ViewController, UISlider>, KeyPath<ViewController, UILabel>)]
    ) {
        for keyPathPair in keyPathPairsForUpdate {
            self[keyPath: keyPathPair.1].text = "\(Int(self[keyPath: keyPathPair.0].value))"
        }
    }
    
    func updateEdgeInsets(
        edgeInsetKeyPath:WritableKeyPath<UIButton, UIEdgeInsets>,
        keyPathPairsForContentEdge: [(KeyPath<ViewController, UISlider>, WritableKeyPath<UIEdgeInsets, CGFloat>)]
    ) {
        var edgeInsets: UIEdgeInsets = .zero
        for keyPath in keyPathPairsForContentEdge {
            edgeInsets[keyPath: keyPath.1] = CGFloat(self[keyPath: keyPath.0].value)
        }

        ios13Button[keyPath: edgeInsetKeyPath] = edgeInsets
    }
    
    
    @IBAction func titleValueChanged(_ sender: Any) {
        let edgeInsetKeyPath: WritableKeyPath<UIButton, UIEdgeInsets> = \UIButton.titleEdgeInsets
        let keyPathPairsForUpdate: [(KeyPath<ViewController, UISlider>, KeyPath<ViewController, UILabel>)] = [
            (\.titleTopSlider, \.titleTopLabel),
            (\.titleBottomSlider, \.titleBottomLabel),
            (\.titleLeftSlider, \.titleLeftLabel),
            (\.titleRightSlider, \.titleRightLabel),
        ]
        let keyPathPairsForContentEdge: [(KeyPath<ViewController, UISlider>, WritableKeyPath<UIEdgeInsets, CGFloat>)] = [
            (\.titleTopSlider, \.top),
            (\.titleBottomSlider, \.bottom),
            (\.titleLeftSlider, \.left),
            (\.titleRightSlider, \.right),
        ]
        
        updateSlider(keyPathPairsForUpdate: keyPathPairsForUpdate)
        updateEdgeInsets(
            edgeInsetKeyPath: edgeInsetKeyPath,
            keyPathPairsForContentEdge: keyPathPairsForContentEdge
        )
    }

    @IBAction func imageValueChanged(_ sender: Any) {
        let edgeInsetKeyPath: WritableKeyPath<UIButton, UIEdgeInsets> = \UIButton.imageEdgeInsets
        let keyPathPairsForUpdate: [(KeyPath<ViewController, UISlider>, KeyPath<ViewController, UILabel>)] = [
            (\.imageTopSlider, \.imageTopLabel),
            (\.imageBottomSlider, \.imageBottomLabel),
            (\.imageLeftSlider, \.imageLeftLabel),
            (\.imageRightSlider, \.imageRightLabel),
        ]
        let keyPathPairsForContentEdge: [(KeyPath<ViewController, UISlider>, WritableKeyPath<UIEdgeInsets, CGFloat>)] = [
            (\.imageTopSlider, \.top),
            (\.imageBottomSlider, \.bottom),
            (\.imageLeftSlider, \.left),
            (\.imageRightSlider, \.right),
        ]
        updateSlider(keyPathPairsForUpdate: keyPathPairsForUpdate)
        updateEdgeInsets(
            edgeInsetKeyPath: edgeInsetKeyPath,
            keyPathPairsForContentEdge: keyPathPairsForContentEdge
        )
    }
    
    @IBAction func contentValueChanged(_ sender: Any?) {
        let edgeInsetKeyPath: WritableKeyPath<UIButton, UIEdgeInsets> = \UIButton.contentEdgeInsets
        let keyPathPairsForUpdate: [(KeyPath<ViewController, UISlider>, KeyPath<ViewController, UILabel>)] = [
            (\.contentTopSlider, \.contentTopLabel),
            (\.contentBottomSlider, \.contentBottomLabel),
            (\.contentLeftSlider, \.contentLeftLabel),
            (\.contentRightSlider, \.contentRightLabel),
        ]
        let keyPathPairsForContentEdge: [(KeyPath<ViewController, UISlider>, WritableKeyPath<UIEdgeInsets, CGFloat>)] = [
            (\.contentTopSlider, \.top),
            (\.contentBottomSlider, \.bottom),
            (\.contentLeftSlider, \.left),
            (\.contentRightSlider, \.right),
        ]
        updateSlider(keyPathPairsForUpdate: keyPathPairsForUpdate)
        updateEdgeInsets(
            edgeInsetKeyPath: edgeInsetKeyPath,
            keyPathPairsForContentEdge: keyPathPairsForContentEdge
        )
    }
    
    @IBAction func configulationValueChange(_ sender: Any) {
        let keyPathPairsForUpdate: [(KeyPath<ViewController, UISlider>, KeyPath<ViewController, UILabel>)] = [
            (\.ios15TitleTopSlider, \.ios15TitleTopLabel),
            (\.ios15TitleBottomSlider, \.ios15TitleBottomLabel),
            (\.ios15TitleLeftSlider, \.ios15TitleLeftLabel),
            (\.ios15TitleRightSlider, \.ios15TitleRightLabel),
            (\.ios15ImageTopSlider, \.ios15ImageTopLabel),
            (\.ios15ImageBottomSlider, \.ios15ImageBottomLabel),
            (\.ios15ImageLeftSlider, \.ios15ImageLeftLabel),
            (\.ios15ImageRightSlider, \.ios15ImageRightLabel),
            (\.ios15ContentTopSlider, \.ios15ContentTopLabel),
            (\.ios15ContentBottomSlider, \.ios15ContentBottomLabel),
            (\.ios15ContentLeftSlider, \.ios15ContentLeftLabel),
            (\.ios15ContentRightSlider, \.ios15ContentRightLabel)
        ]
        updateSlider(keyPathPairsForUpdate: keyPathPairsForUpdate)
        
        var configuration = ios15Button.configuration ?? UIButton.Configuration.plain()
        
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: CGFloat(ios15ContentTopSlider.value),
            leading:  CGFloat(ios15ContentLeftSlider.value),
            bottom: CGFloat(ios15ContentBottomSlider.value),
            trailing: CGFloat(ios15ContentRightSlider.value)
        )
        
        configuration.imagePadding = CGFloat(ios15ImageTopSlider.value)
        
        configuration.titlePadding = CGFloat(ios15TitleTopSlider.value)

        
        
        
        ios15Button.configuration = configuration
    }
    
    
    
    
}

