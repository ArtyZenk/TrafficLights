//
//  ViewController.swift
//  TrafficLights
//
//  Created by Artyom Guzenko on 16.02.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    // MARK: - Elements
    private lazy var redLight: UIView = {
        let redLight = UIView()
        redLight.backgroundColor = .systemRed
        redLight.translatesAutoresizingMaskIntoConstraints = false
        return redLight
    }()

    private lazy var yellowLight: UIView = {
        let yellowLight = UIView()
        yellowLight.backgroundColor = .systemYellow
        yellowLight.translatesAutoresizingMaskIntoConstraints = false
        return yellowLight
    }()

    private lazy var greenLight: UIView = {
        let greenLight = UIView()
        greenLight.backgroundColor = .systemGreen
        greenLight.translatesAutoresizingMaskIntoConstraints = false
        return greenLight
    }()

    private lazy var lightsStackView: UIStackView = {
        let lights = UIStackView()
        lights.axis = .vertical
        lights.spacing = 40
        lights.translatesAutoresizingMaskIntoConstraints = false
        return lights
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("START", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarch()
        setupLayout()
        setupView()
    }


}

extension ViewController {
    private func setupHierarch() {
        view.addSubview(lightsStackView)
        view.addSubview(startButton)
        
        lightsStackView.addArrangedSubview(redLight)
        lightsStackView.addArrangedSubview(yellowLight)
        lightsStackView.addArrangedSubview(greenLight)
    }
    
    private func setupLayout() {
        
    }
    
    private func setupView() {
    }
}
