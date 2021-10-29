//
//  ViewController.swift
//  appTestTaskFamily
//
//  Created by Ramazan on 28.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        designMenu()
        
 }
    func designMenu(){
        
        
        let stackView = UIStackView()
        stackView.axis  = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        
        let labelTitle = UILabel()
        labelTitle.text = "Тестовое Задание"
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont(name: labelTitle.font.fontName, size: 33)
        labelTitle.textColor = .orange
        stackView.addArrangedSubview(labelTitle)

        
        
        
        let buttonStart = UIButton()
        buttonStart.setTitle("Начать", for: .normal)
        buttonStart.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        buttonStart.setTitleColor(.blue, for: .normal)
        buttonStart.addTarget(self, action: #selector(openListView), for: .touchUpInside)
        
        stackView.addArrangedSubview(buttonStart)
        
        
        
    }
    
    @objc func openListView(){
        let addFamilyView = addFamilyVC()
        addFamilyView.modalPresentationStyle = .fullScreen
       self.present(addFamilyView, animated: true)
    }
}

