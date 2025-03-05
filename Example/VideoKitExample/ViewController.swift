//
//  ViewController.swift
//  VideoKitExample

import UIKit
import FSVideoKit

final class ViewController: UIViewController {
    
    private let assetIdField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        textField.placeholder = "Kayo assetId e.g 53208"
        textField.textAlignment = .center
        textField.clearButtonMode = .always
        return textField
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Play", for: .normal)
        return button
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.setTitle("Logout", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

private extension ViewController {
    
    func setup() {
        navigationItem.title = "Sample VideoKit"
        let stackView = UIStackView(arrangedSubviews: [assetIdField, playButton, logoutButton])
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        playButton.addTarget(self, action: #selector(playButtonAction), for: .primaryActionTriggered)
        logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 250),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 70),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            assetIdField.heightAnchor.constraint(equalToConstant: 44),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        assetIdField.delegate = self
        refreshLogoutStatus()
    }
    
    func refreshLogoutStatus() {
        FSAuthManager.shared.authenticationStatus(shouldRefresh: true) { [weak self] status in
            self?.logoutButton.isHidden = !status
        }
    }
    
    @objc func logoutButtonAction() {
        FSAuthManager.shared.logout { [weak self] _ in
            self?.refreshLogoutStatus()
        }
    }
    
    @objc func playButtonAction() {
        guard let assetId = assetIdField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        assetIdField.resignFirstResponder()
        let playerViewController = FSPlayerViewController()
        playerViewController.printDebugLog = true
        playerViewController.modalPresentationStyle = .fullScreen
        present(playerViewController, animated: true) {
            // Get a new asset ID from Kayo if stream is not starting
            print("➡️ Play asset ", assetId)
            playerViewController.play(withAssetId: assetId)
        }
        
        playerViewController.delegate = self
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
    
}

extension ViewController: FSPlayerViewControllerDelegate {
    
    func playerController(_ controller: FSVideoKit.FSPlayerViewController, didChangeStatus status: FSVideoKit.FSPlayerStatus) {
        switch status {
        case .playing:
            print("➡️ didChangeStatus playing")
        case .paused:
            print("➡️ didChangeStatus paused")
        case .stopped:
            print("➡️ didChangeStatus stopped")
        @unknown default:
            print("➡️ Unknown reason")
        }
    }
    
    func playerController(_ controller: FSPlayerViewController, didFailWith error: Error) {
        print("➡️ didFailWith ", error)
    }
    
    func playerControllerDidPressCloseButton(_ controller: FSPlayerViewController) {
        print("➡️ playerControllerDidPressCloseButton")
        dismiss(animated: true)
    }
    
    func playerControllerDidPresentLogin(_ controller: FSPlayerViewController) {
        print("➡️ playerControllerDidPresentLogin")
    }
    
    func playerControllerDidLoginSuccessfully(_ controller: FSPlayerViewController) {
        print("➡️ playerControllerDidLoginSuccessfully")
        refreshLogoutStatus()
    }
    
    func playerControllerDidDismissLogin(_ controller: FSPlayerViewController) {
        print("➡️ playerControllerDidDismissLogin")
        dismiss(animated: true)
        refreshLogoutStatus()
    }
    
    func playerController(_ controller: FSPlayerViewController, didFailLoginWith error: Error) {
        print("➡️ didFailLoginWith ", error)
        refreshLogoutStatus()
    }
    
    func playerControllerDidExceedStreamLimit(_ controller: FSPlayerViewController) {
        print("➡️ playerControllerDidExceedStreamLimit")
    }
    
    func playerController(_ controller: FSPlayerViewController, ErrorDisplayForAuthenticationError error: AuthenticationError) -> ErrorDisplayModel {
        refreshLogoutStatus()
        switch error {
        case .incompleteAccount:
            return .init(title: "Login", message: "Unable to login, please try again later.")
        case .noAccessToken, .noRefreshToken, .inactiveAccount, .unknown:
            return ErrorDisplayModel(error: error)
        @unknown default:
            fatalError("Unexpected error")
        }
    }
    
}
