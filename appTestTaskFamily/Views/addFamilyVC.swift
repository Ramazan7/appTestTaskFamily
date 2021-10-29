//
//  addFamilyVC.swift
//  appTestTaskFamily
//
//  Created by Ramazan on 28.10.2021.
//

import UIKit

class addFamilyVC: UIViewController {
    let scrollView = UIScrollView()
    let parentsView = UIView()
    let childrenView = UIView()
    let listchildrenView = UIView()
    var parentData = ["name","age"]
    var tempChildArray = [String]()
    var childData = [String:Int]()
    let screenSize = UIScreen.main.bounds
    let nameTextField = UITextField()
    let ageTextField = UITextField()
    let nameChildrenTF = UITextField()
    let ageChildrenTF = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height + 200)
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        if(!parentData.isEmpty){
            loadData()
        }
        designParentView()
        designChildrenView()
        listViewChildren()
        // Do any additional setup after loading the view.
    }
    

    func designParentView(){
        
        scrollView.addSubview(parentsView)
        
        parentsView.translatesAutoresizingMaskIntoConstraints = false
        parentsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        parentsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 70).isActive = true
        parentsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -30).isActive = true
        parentsView.heightAnchor.constraint(equalToConstant: CGFloat(screenSize.height / 3)).isActive = true
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        
        parentsView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: parentsView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: parentsView.widthAnchor, constant: -20).isActive = true
        stackView.centerXAnchor.constraint(equalTo: parentsView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: parentsView.centerYAnchor).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Заполните поля"
        stackView.addArrangedSubview(titleLabel)
        
        
        let nameLabel = UILabel()
        nameLabel.text = "Имя:"
        stackView.addArrangedSubview(nameLabel)
    
        nameTextField.borderStyle = .bezel
        nameTextField.placeholder = "Введите имя........."
        stackView.addArrangedSubview(nameTextField)
        
        let ageLabel = UILabel()
        ageLabel.text = "Возраст:"
        stackView.addArrangedSubview(ageLabel)
        
        ageTextField.borderStyle = .bezel
        ageTextField.placeholder = "Введите возраст......"
        stackView.addArrangedSubview(ageTextField)
        
        let buttonSave = UIButton()
        buttonSave.setTitle("Сохранить", for: .normal)
        buttonSave.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonSave.setTitleColor(.blue, for: .normal)
        buttonSave.addTarget(self, action: #selector(buttonSaveAction), for: .touchUpInside)
        stackView.addArrangedSubview(buttonSave)
        
        let buttonAddChild = UIButton()
        buttonAddChild.setTitle("+", for: .normal)
        buttonAddChild.titleLabel?.font = UIFont.systemFont(ofSize: 33)
        buttonAddChild.setTitleColor(.blue, for: .normal)
        buttonAddChild.addTarget(self, action: #selector(buttonAddChildAction), for: .touchUpInside)
        parentsView.addSubview(buttonAddChild)
        
        buttonAddChild.translatesAutoresizingMaskIntoConstraints = false
        buttonAddChild.centerYAnchor.constraint(equalTo: buttonSave.centerYAnchor).isActive = true
        buttonAddChild.centerXAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
       
        
    }
    
    func designChildrenView(){
        childrenView.isHidden = true
        scrollView.addSubview(childrenView)
        
        childrenView.translatesAutoresizingMaskIntoConstraints = false
        childrenView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        childrenView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 70).isActive = true
        childrenView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -30).isActive = true
        childrenView.heightAnchor.constraint(equalToConstant: CGFloat(screenSize.height / 3)).isActive = true
    
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        
        childrenView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: parentsView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: parentsView.widthAnchor, constant: -50).isActive = true
        stackView.heightAnchor.constraint(equalTo: parentsView.heightAnchor, constant: -50).isActive = true
        stackView.centerXAnchor.constraint(equalTo: parentsView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: parentsView.centerYAnchor).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Добавление детей"
        stackView.addArrangedSubview(titleLabel)
        
        
        let nameLabel = UILabel()
        nameLabel.text = "Имя:"
        stackView.addArrangedSubview(nameLabel)
        
      
        nameChildrenTF.borderStyle = .bezel
        nameChildrenTF.placeholder = "Введите имя........."
        stackView.addArrangedSubview(nameChildrenTF)
        
        let ageLabel = UILabel()
        ageLabel.text = "Возраст:"
        stackView.addArrangedSubview(ageLabel)
        
        
        ageChildrenTF.borderStyle = .bezel
        ageChildrenTF.placeholder = "Введите возраст......"
        stackView.addArrangedSubview(ageChildrenTF)
        
        let buttonSave = UIButton()
        buttonSave.setTitle("Сохранить", for: .normal)
        buttonSave.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonSave.setTitleColor(.blue, for: .normal)
        buttonSave.addTarget(self, action: #selector(buttonSaveAction), for: .touchUpInside)
        stackView.addArrangedSubview(buttonSave)
        
        
        let buttonAddChild = UIButton()
        buttonAddChild.setTitle("<-", for: .normal)
        buttonAddChild.titleLabel?.font = UIFont.systemFont(ofSize: 33)
        buttonAddChild.setTitleColor(.blue, for: .normal)
        buttonAddChild.addTarget(self, action: #selector(buttonBackChildAction), for: .touchUpInside)
        childrenView.addSubview(buttonAddChild)
        
        buttonAddChild.translatesAutoresizingMaskIntoConstraints = false
        buttonAddChild.centerYAnchor.constraint(equalTo: buttonSave.centerYAnchor).isActive = true
        buttonAddChild.centerXAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
    }
    
    @objc func buttonSaveAction(){
        if(childrenView.isHidden){
            parentData[0] = nameTextField.text!
            parentData[1] = ageTextField.text!
            saveData()
        }
        else {
            if(ageChildrenTF.text != "" && nameChildrenTF.text != ""){
            let age:Int = Int(ageChildrenTF.text!)!
            let name = nameChildrenTF.text
            
            childData.updateValue(age, forKey: name!)
            saveData()
            self.listchildrenView.subviews.forEach({ $0.removeFromSuperview() })
            self.listViewChildren()
            }
            
        }
        hidekeyboard()
        
        
    }
    
    @objc func  buttonAddChildAction(){
        parentsView.isHidden = true
        self.childrenView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.childrenView.frame = CGRect(x: -200, y: 150, width: 0, height: 0)
        }, completion: nil)
    }
    
    @objc func  buttonBackChildAction(){
        parentsView.isHidden = false
        self.childrenView.isHidden = true
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.parentsView.frame = CGRect(x: -200, y: 150, width: 0, height: 0)
        }, completion: nil)
        
    }
   
    func saveData() {
        UserDefaults.standard.set(parentData, forKey: "parentData")
        UserDefaults.standard.set(childData, forKey: "childData")
        UserDefaults.standard.synchronize()
    }
    
    func loadData() {
        let dataParents = UserDefaults.standard.object(forKey: "parentData")
        
        if dataParents != nil {
            parentData = dataParents as! [String]
            nameTextField.text = parentData[0]
            ageTextField.text = parentData[1]
        }
        else{
            return
        }
        
        let dataChild = UserDefaults.standard.object(forKey: "childData")
        
        if dataChild != nil {
            childData = dataChild as! [String:Int]
            
        }
        else{
            return
        }
    }
    
    func listViewChildren(){
        
        scrollView.addSubview(listchildrenView)
        
        listchildrenView.translatesAutoresizingMaskIntoConstraints = false
        listchildrenView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -30).isActive = true
        listchildrenView.heightAnchor.constraint(equalToConstant: CGFloat(screenSize.height / 3)).isActive = true
        listchildrenView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        listchildrenView.topAnchor.constraint(equalTo: parentsView.bottomAnchor, constant: 30).isActive = true
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        listchildrenView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: listchildrenView.topAnchor, constant: 70).isActive = true
        stackView.widthAnchor.constraint(equalTo: listchildrenView.widthAnchor, constant: -20).isActive = true
        stackView.heightAnchor.constraint(equalTo: listchildrenView.heightAnchor, constant: -10).isActive = true
        
        let childCountLabel = UILabel()
        childCountLabel.text = "Количество детей: " + String(childData.count)
        stackView.addArrangedSubview(childCountLabel)
        
        let buttonClear = UIButton()
        buttonClear.setTitle("Очистить", for: .normal)
        buttonClear.setTitleColor(.red, for: .normal)
        buttonClear.addTarget(self, action: #selector(clearChildAction), for: .touchUpInside)
        stackView.addSubview(buttonClear)
        
        buttonClear.translatesAutoresizingMaskIntoConstraints = false
        buttonClear.centerYAnchor.constraint(equalTo: childCountLabel.centerYAnchor).isActive = true
        buttonClear.centerXAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40).isActive = true
        stackView.setCustomSpacing(30, after: childCountLabel)
        var count = 0
        childData.forEach({ item in
            count = count + 1
            tempChildArray.append(item.key)
            let titleText = "Имя: " + item.key + "\n" + "Возраст: " + String(item.value)
            let titleLabel = UILabel()
            titleLabel.text = titleText
            titleLabel.numberOfLines = 0
            stackView.addArrangedSubview(titleLabel)
            
            let button = UIButton()
            button.setTitle("Удалить", for: .normal)
            button.tag = count
            button.setTitleColor(.red, for: .normal)
            button.addTarget(self, action: #selector(deleteChildAction), for: .touchUpInside)
            stackView.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
            button.centerXAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40).isActive = true
            
        })
        
        // bug action last button stackview
          let testlabel = UILabel()
        testlabel.text = " "
        stackView.addArrangedSubview(testlabel)
    }
    
    @objc func clearChildAction(){

        let alertController = UIAlertController(
            title: "Вы уверены?",
            message: nil,
            preferredStyle: .alert
        )

        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .destructive) { (action) in
            // ...
        }

        let confirmAction = UIAlertAction(
            title: "Очистить", style: .default) { (action) in
                self.childData.removeAll()
                UserDefaults.standard.set(self.childData, forKey: "childData")
                UserDefaults.standard.synchronize()
                self.listchildrenView.subviews.forEach({ $0.removeFromSuperview() })
                self.listViewChildren()
        }

        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func deleteChildAction(sender: UIButton!){
        childData.removeValue(forKey: tempChildArray[sender.tag - 1])
        saveData()
        self.listchildrenView.subviews.forEach({ $0.removeFromSuperview() })
        self.listViewChildren()
       
    }

}
#if canImport(UIKit)
extension UIViewController{
    func hidekeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
