//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 17.01.2023.
//

import UIKit

class HabitViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var colorPicker = makeColorPicker()
    
    private var date: Date = Date()
    private var name: String = ""
    private var color: UIColor = UIColor()
    
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Arial normal", size: 17)
        title.textColor = .black
        title.text = "НАЗВАНИЕ"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let textField: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.backgroundColor = .white
        text.font = UIFont(name: "Arial normal", size: 16)
        text.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        text.autocapitalizationType = .none
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let colorLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Arial normal", size: 17)
        title.textColor = .black
        title.text = "ЦВЕТ"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let colorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255.0, green: 159/255.0, blue: 79/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timeLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Arial normal", size: 17)
        title.textColor = .black
        title.text = "Время"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let timeDescriptionLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Arial normal", size: 17)
        title.textColor = .black
        title.text = "Каждый день в"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let timePicker: UIDatePicker = {
        let time = UIDatePicker()
        time.datePickerMode = .countDownTimer
        time.date = .now
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupGestures()
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Создать"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorButton.backgroundColor = viewController.selectedColor
        color = viewController.selectedColor
        }
    
    private func setupUI() {
        setupBarButtonItem()
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(textField)
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(colorButton)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(timeDescriptionLabel)
        scrollView.addSubview(timePicker)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            colorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 15),
            colorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            timeDescriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            timeDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            timePicker.topAnchor.constraint(equalTo: timeDescriptionLabel.bottomAnchor, constant: 15),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func addTargets() {
        colorButton.addTarget(self, action: #selector(tapOnColorBotton), for: .touchUpInside)
        timePicker.addTarget(self, action: #selector(saveDate), for: .valueChanged)
        textField.addTarget(self, action: #selector(saveName), for: .editingChanged)
    }
    
    private func makeColorPicker() -> UIColorPickerViewController {
        let vc = UIColorPickerViewController()
        vc.delegate = self
        vc.selectedColor = UIColor(red: 255/255.0, green: 159/255.0, blue: 79/255.0, alpha: 1.0)
        vc.supportsAlpha = true
        return vc
    }

    private func presentColorPicker() {
        present(colorPicker, animated: true)
    }
    
    private func setupBarButtonItem() {
        let leftBarItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancel))
        let rightBarItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(save))
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc private func cancel() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func save() {
        let newHabit = Habit(name: name,
                             date: date,
                             color: color)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func tapOnColorBotton() {
        presentColorPicker()
    }
    
    @objc private func saveDate() {
        date = timePicker.date
    }
    
    @objc private func saveName() {
        name = textField.text!
    }
    
    @objc private func didHideKeyboard (_ notification: Notification) {
        forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        view.endEditing(true)
    }
    
}
